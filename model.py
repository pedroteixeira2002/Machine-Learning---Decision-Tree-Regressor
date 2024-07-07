import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor
import joblib

# Sample DataFrame (replace with your actual DataFrame)
data = pd.read_csv('filtered_data.csv')
df = pd.DataFrame(data)

# Encode categorical variables
categorical_features = ['experience_level', 'employment_type', 'job_title', 'company_size']
df = pd.get_dummies(df, columns=categorical_features, drop_first=True)

# Split the data into features and target variable
X = df.drop('salary_in_usd', axis=1)
y = df['salary_in_usd']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Initialize and train the Decision Tree model
model = DecisionTreeRegressor(random_state=42)
model.fit(X_train, y_train)

# Save the trained model
joblib.dump(model, 'decision_tree_model.pkl')
joblib.dump(X_train.columns.tolist(), 'feature_columns.pkl')
