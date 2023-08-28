import pandas as pd
import string

df = pd.read_csv('../data/heart_cleaned.csv')

program = "cad(n). cad(y). " \
          "type(f). type(m). " \
          "level(l). level(m). level(h). level(n)." \
          "\n"

for label in df:
    if label == "target":
        labels = ["n", "y"]  # no, yes -> cad().
        bins = [0, 0.5, 1]
    elif label == "sex":
        labels = ["f", "m"]  # female, male -> type().
        bins = [0, 0.5, 1]
    elif label == "age":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [29, 45, 60, 77]
    elif label == "cp":
        labels = ["h", "m", "l", "n"]  # high, medium, low, normal -> level().
        bins = [-0.5, 0.5, 1.5, 2.5, 3.5]
    elif label == "trestbps":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [94, 120, 140, 200]
    elif label == "chol":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [126, 150, 499, 564]
    elif label == "fbs":
        labels = ["h", "d"]  # healthy, diabetes -> type().
        bins = [0, 0.5, 1]
    elif label == "restecg":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [-0.5, 0.5, 1.5, 2.5]
    elif label == "thalach":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [71, 101, 142, 202]
    elif label == "exang":
        labels = ["n", "y"]  # no, yes -> type().
        bins = [0, 0.5, 1]
    elif label == "oldpeak":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [0.0, 2.0, 4.0, 6.2]
    elif label == "slope":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [-0.5, 0.5, 1.5, 2.5]
    elif label == "ca":
        labels = ["n", "l", "m", "h"]  # normal, low, medium, high -> level().
        bins = [-0.5, 0.5, 1.5, 2.5, 3.5]
    elif label == "thal":
        labels = ["l", "m", "h"]  # low, medium, high -> level().
        bins = [0.5, 1.5, 2.5, 3.5]
    df[label] = pd.cut(df[label], bins=bins, labels=labels, include_lowest=True)
    if label == "target":
        num = len(df.columns) - 1
        for n in range(pow(2, num)):
            params = "(A,"
            bstr = format(n, "0" + str(num) + "b")
            clause = ""
            comma = ""
            n = 1
            for l in df:
                if l == "target":
                    continue
                params += comma + string.ascii_uppercase[n]

                if bstr[n - 1] == "0":
                    l = "\+" + l
                clause += comma + l + "(A," + string.ascii_uppercase[n] + ")"
                n += 1
                comma = ", "
                pass
            params += ")"
            program += (
                    label + params + ":- " + clause + ", cad(A).\n"
            )
            pass
    elif label == "sex" or label == "fbs" or label == "exang":
        program += "t(0.5,A,B)::" + label + "(A,B):- type(B).\n"
    else:
        program += "t(0.5,A,B)::" + label + "(A,B):- level(B).\n"

training_samples = int(len(df) * 0.9)
testing_samples = len(df) - training_samples

# Get the first 90% of the dataset for training
training_data = df.head(training_samples)

# Save the training data to a CSV file
training_data.to_csv("../data/training_data.csv", index=False)

# Get the last 10% of the dataset for testing
testing_data = df.tail(testing_samples)

# Save the testing data to a CSV file
testing_data.to_csv("../data/testing_data.csv", index=False)

evidence = ""

for i in range(len(training_data)):
    data = df.iloc[i]
    data = data.tolist()
    comma = ""
    d = 0
    for label in df:
        if label == "target" or d == 6:
            break
        if data[-1] == "y":
            evidence += (
                "evidence(" + label + "(" + data[-1] + "," + data[d] + "), true).\n"
            )
            new_d = "n"
            evidence += (
                "evidence(" + label + "(" + new_d + "," + data[d] + "), false).\n"
            )
        else:
            evidence += (
                "evidence(" + label + "(" + data[-1] + "," + data[d] + "), true).\n"
            )
            new_d = "y"
            evidence += (
                "evidence(" + label + "(" + new_d + "," + data[d] + "), false).\n"
            )
        d += 1
    evidence += "-----\n"

with open("training_evidence.pl", "w") as evidence_file:
    evidence_file.write(evidence)

with open("untrained_model.pl", "w") as prob_file:
    prob_file.write(program)
