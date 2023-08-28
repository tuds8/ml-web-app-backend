import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load the initial dataset
df = pd.read_csv('../data/heart.csv')
distinct_count = len(df.drop_duplicates())
duplicate_count = len(df) - distinct_count
print(f'{distinct_count} distinct rows and {duplicate_count} duplicated rows')

# Dropping the duplicated values
df = df.drop_duplicates()

# Dropping the lines that contain wrong data
df = df.drop(df[df['ca'] == 4].index)
df = df.drop(df[df['thal'] == 0].index)

# Dropping the columns that are not used for model prediction
columns_to_drop = ['restecg', 'fbs', 'oldpeak', 'exang', 'slope', 'ca', 'thal']  # Specify the columns you want to drop
df = df.drop(columns_to_drop, axis=1)

# Check for missing values
missing_values = df.isnull().sum()
print("Missing Values:\n", missing_values)

# Check if there are missing values
if missing_values.any():
    # Fill the missing values with the mean
    df_imputed = df.fillna(df.mean())
    print("Data with imputed values:\n", df_imputed.head(10))
else:
    print("No missing values found. Proceeding with the original dataset:\n", df.head(10))

# Check for outliers
Q1 = df.quantile(0.25)
Q3 = df.quantile(0.75)
IQR = Q3 - Q1
outliers = ((df < (Q1 - 1.5 * IQR)) | (df > (Q3 + 1.5 * IQR))).any(axis=1)

# Print the number of outliers detected
num_outliers = outliers.sum()
print("Number of Outliers Detected:", num_outliers)

# Distribution of 0s and 1s in the target column
target_distribution = df['target'].value_counts()
print("Distribution of 0s and 1s in the target column:\n", target_distribution)

# Create a bar plot with age on the x-axis and count of target values on the y-axis
plt.figure(figsize=(8, 6))
sns.countplot(data=df, x='age', hue='target')

# Set plot title and axes labels
plt.title('Distribution of Target based on Age (before target modifying)')
plt.xlabel('Age')
plt.ylabel('Count')

# Display the plot
plt.show()

# Reversing the target column after observing the plot distribution
df['target'] = 1 - df['target']

# Saving the modified dataset
df.to_csv('../data/heart_cleaned.csv', index=False)

# Loading the newly modified dataset
df = pd.read_csv('../data/heart_cleaned.csv')

# Re-checking the distribution of 0s and 1s in the target column
target_distribution2 = df['target'].value_counts()
print("Distribution of 0s and 1s after fixing the data in the target column:\n", target_distribution2)

# Create a bar plot with age on the x-axis and count of target values on the y-axis
plt.figure(figsize=(8, 6))
sns.countplot(data=df, x='age', hue='target')

# Set plot title and axes labels
plt.title('Distribution of Target based on Age (after target modifying)')
plt.xlabel('Age')
plt.ylabel('Count')

# Display the plot
plt.show()
