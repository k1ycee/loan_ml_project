from flask import Flask, request, jsonify
import pickle as pkl
import numpy as np

app = Flask(__name__)

# Load the pre-trained logistic regression model
model_filename = 'logistic_model.pkl'
loaded_model = pkl.load(open(model_filename, 'rb'))

# Define a route for predicting loan approval
@app.route('/predict_loan_approval', methods=['POST'])
def predict_loan_approval():
    try:
        # Get data from the request
        data = request.get_json(force=True)

        # Extract features from the data
        features = [data['Credit_History'], data['Education'], data['Loan_Amount_Term'],
                    data['ApplicantIncome'], data['CoapplicantIncome'],
                    data['Self_Employed'], data['LoanAmount']]

        # Convert features to numpy array and reshape
        features = np.array(features).reshape(1, -1)

        # Make prediction using the loaded model
        prediction = loaded_model.predict(features)

        # Return the prediction as JSON response
        return jsonify({'prediction': int(prediction[0])})

    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(port=3030, debug=True)