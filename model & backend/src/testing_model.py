import pandas as pd
from problog.program import PrologString
from problog import get_evaluatable
from sklearn.metrics import precision_score, recall_score, f1_score, confusion_matrix, roc_curve, roc_auc_score
import matplotlib.pyplot as plt
import numpy as np

# Load the trained model
with open("trained_model.pl", "r") as f:
    program_string = f.read()

# Load the testing dataset into a DataFrame
df = pd.read_csv("../data/testing_data.csv")

actual_classes = df.iloc[:, -1].tolist()  # Get the actual classes from the last column
predictions = {}

correct_predictions = 0
total_predictions = 0

str_results = ""
for i in range(len(df)):
    data = df.iloc[i]
    data = data.tolist()
    comma = ""
    last = data[-1]
    data.pop()
    data.insert(0, last)
    dd = "".join([item + " " for item in data])
    dd = dd.strip()
    dd = dd.replace(" ", ",")
    print(i, dd)
    str_results += "target(" + dd + "), " + dd[0] + ": "
    query = "\nquery(target(" + "A" + dd[1:] + "))."
    print("query is: " + query)
    p = PrologString(program_string + query)
    print("Evaluating...")

    results = get_evaluatable().create_from(p).evaluate()

    for result in results:
        print("result is: ", result)
        r = float(results[result])
        print("r: ", r)
        predictions[i, str(result)[7]] = r
        str_results += " " + str(result)[7] + ": " + str(r) + ","

    if predictions[i, 'y'] > predictions[i, 'n']:
        predicted_class = 'y'
    else:
        predicted_class = 'n'

    if predicted_class == actual_classes[i]:
        correct_predictions += 1

    total_predictions += 1

    str_results += "\n"
    print(str_results)

accuracy = correct_predictions / total_predictions
str_results += "\nAccuracy: " + str(accuracy) + "\n"

# Calculate precision, recall, and F1-score
y_true = [actual_classes[i] for i in range(len(df))]
y_pred = ['y' if predictions[i, 'y'] > predictions[i, 'n'] else 'n' for i in range(len(df))]
precision = precision_score(y_true, y_pred, pos_label='y')
recall = recall_score(y_true, y_pred, pos_label='y')
f1 = f1_score(y_true, y_pred, pos_label='y')

# Calculate ROC curve and AUC score
y_scores = [predictions[i, 'y'] for i in range(len(df))]
fpr, tpr, thresholds = roc_curve(y_true, y_scores, pos_label='y')
auc_score = roc_auc_score(y_true, y_scores)

# Plot the ROC curve
plt.figure()
plt.plot(fpr, tpr, label='ROC curve (AUC = {:.2f})'.format(auc_score))
plt.plot([0, 1], [0, 1], 'k--', label='Random Guessing')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('Receiver Operating Characteristic (ROC) Curve')
plt.legend(loc='lower right')
plt.show()

# Calculate confusion matrix
cm = confusion_matrix(y_true, y_pred)

# Display the confusion matrix
plt.figure(figsize=(8, 6))
labels = ['Negative', 'Positive']
plt.imshow(cm, interpolation='nearest', cmap=plt.cm.Blues)
plt.title('Confusion Matrix')
plt.colorbar()
tick_marks = np.arange(len(labels))
plt.xticks(tick_marks, labels)
plt.yticks(tick_marks, labels)
plt.xlabel('Predicted')
plt.ylabel('Actual')
for i in range(len(labels)):
    for j in range(len(labels)):
        plt.text(j, i, str(cm[i, j]), horizontalalignment='center', verticalalignment='center', color='black')
plt.show()

str_results += "Precision: " + str(precision) + "\n"
str_results += "Recall: " + str(recall) + "\n"
str_results += "F1-score: " + str(f1) + "\n"
str_results += "Confusion Matrix:\n" + str(cm) + "\n"
str_results += "AUC: " + str(auc_score) + "\n"

with open("../data/testing_results.txt", "w") as results_file:
    results_file.write(str_results)

