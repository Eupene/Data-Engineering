import pandas as pd

# Load the dataset
df = pd.read_csv("trestle_academy_dataset.csv")

# Preview the data
print(df.head())

# Identify and Handle Missing Values
# Check for missing values
missing_values = df.isnull().sum()
print("\nMissing Values:")
print(missing_values)

# Handle missing values 
df['age'].fillna(df['age'].mean(), inplace=True)
df['enrollment_date'].fillna(df['enrollment_date'].mode()[0], inplace=True)

# Standardize Data Types
df['age'] = df['age'].astype(int)
df['enrollment_date'] = pd.to_datetime(df['enrollment_date'], errors='coerce')

# Normalize Text Data
df['course'] = df['course'].str.title()

# Filter Unwanted Data
df = df[(df['age'] >= 18) & (df['age'] <= 45)]

# Correct Inconsistent Entries for Binary Columns
df['is_intern'] = df['is_intern'].replace({'yes': 'Yes', 'no': 'No'})

# Save the Cleaned Data to a New File
df.to_csv("cleaned_data.csv", index=False)
print("\nCleaned data saved to 'cleaned_data.csv'.")