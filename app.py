import joblib
import pandas as pd
from flask import Flask, request, render_template, jsonify

app = Flask(__name__)

# Load the trained model
model = joblib.load('models/decision_tree_model.pkl')

# Load the feature columns
feature_columns = joblib.load('models/feature_columns.pkl')


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/predict', methods=['POST'])
def predict():
    data = request.form.to_dict()
    input_data = pd.DataFrame([data])

    # Convert input data to the same format used during training
    input_data = pd.get_dummies(input_data)
    missing_cols = set(feature_columns) - set(input_data.columns)
    for col in missing_cols:
        input_data[col] = 0
    input_data = input_data[feature_columns]

    prediction = model.predict(input_data)
    return jsonify({'prediction': prediction[0]})


if __name__ == '__main__':
    app.run(debug=True)
