from flask import Flask, request, jsonify
from flask_cors import CORS
from problog.program import PrologString
from problog import get_evaluatable
import os
import subprocess

app = Flask(__name__)
CORS(app)

model_file_path = "../src/trained_model.pl"


def generate_trained_model():
    generation_command = "problog lfi untrained_model.pl training_evidence.pl -O trained_model.pl"
    generation_directory = "../src/"

    if not os.path.exists(model_file_path):
        try:
            subprocess.run(generation_command, shell=True, check=True, cwd=generation_directory)
            return True
        except subprocess.CalledProcessError as e:
            print(f'Generating trained model failed: {str(e)}')
            return False


generate_trained_model()

# Load the trained model
with open(model_file_path, "r") as f:
    program_string = f.read()


# Route to handle the form submission
@app.route('/api/submit', methods=['OPTIONS', 'POST'])
def submit():
    if request.method == 'OPTIONS':
        # Handle the OPTIONS request
        response = jsonify({})
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        response.headers.add('Access-Control-Allow-Methods', 'POST')
        return response
    elif request.method == 'POST':
        # Handle the POST request
        form_data = request.json
        query = create_query(form_data)
        prog = create_model(program_string, query)
        eval = process_prediction(prog)
        print(eval)
        return jsonify(eval)


def create_query(data):
    processed_data = {}
    for key, value in data.items():
        if key == "age":
            if int(value) < 45:
                processed_data[key] = 'l'
            elif 45 <= int(value) < 60:
                processed_data[key] = 'm'
            else:
                processed_data[key] = 'h'
        elif key == "sex":
            if int(value) == 0:
                processed_data[key] = 'f'
            else:
                processed_data[key] = 'm'
        elif key == "chestPain":
            if value == 0:
                processed_data[key] = 'h'
            elif value == 1:
                processed_data[key] = 'm'
            elif value == 2:
                processed_data[key] = 'l'
            else:
                processed_data[key] = 'n'
        elif key == "restingBP":
            if int(value) < 120:
                processed_data[key] = 'l'
            elif 120 <= int(value) < 140:
                processed_data[key] = 'm'
            else:
                processed_data[key] = 'h'
        elif key == "cholesterol":
            if int(value) < 150:
                processed_data[key] = 'l'
            elif 150 <= int(value) < 499:
                processed_data[key] = 'm'
            else:
                processed_data[key] = 'h'
        elif key == "maxHeartRate":
            if int(value) < 101:
                processed_data[key] = 'l'
            elif 101 <= int(value) < 142:
                processed_data[key] = 'm'
            else:
                processed_data[key] = 'h'
    values_string = ','.join(str(value) for value in processed_data.values())
    query = "\nquery(target(A," + str(values_string) + "))."
    return query


def create_model(model, query):
    p = PrologString(model + query)
    return p


def process_prediction(p):
    str_results = ""
    results = get_evaluatable().create_from(p).evaluate()

    for result in results:
        r = float(results[result])
        str_results += str(result)[7] + ": " + str(r) + ", "

    str_results = str_results[:-2]
    str_results = ", ".join("{}: {:.2f}".format(label, float(value)) for label, value in
                                  [pair.strip().split(":") for pair in str_results.split(",")])
    return str_results


# Route to handle preparing the dataset
@app.route('/api/prepare-dataset', methods=['OPTIONS', 'POST'])
def prepare_dataset():
    if request.method == 'OPTIONS':
        # Handle the OPTIONS request
        response = jsonify({})
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        response.headers.add('Access-Control-Allow-Methods', 'POST')
        return response
    elif request.method == 'POST':
        # Execute the command to prepare the dataset
        command = 'python3 preparing_dataset.py'
        working_directory = '../src/'  # Specify the working directory path
        try:
            subprocess.run(command, shell=True, check=True, cwd=working_directory)
            return jsonify({'message': 'Dataset preparation successful'})
        except subprocess.CalledProcessError as e:
            return jsonify({'message': f'Dataset preparation failed: {str(e)}'})


# Route to handle creating the model
@app.route('/api/create-model', methods=['OPTIONS', 'POST'])
def create_model_route():
    if request.method == 'OPTIONS':
        # Handle the OPTIONS request
        response = jsonify({})
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        response.headers.add('Access-Control-Allow-Methods', 'POST')
        return response
    elif request.method == 'POST':
        # Execute the command to create the model
        command = 'python3 creating_model.py'
        working_directory = '../src/'  # Specify the working directory path
        try:
            subprocess.run(command, shell=True, check=True, cwd=working_directory)
            return jsonify({'message': 'Model creation successful'})
        except subprocess.CalledProcessError as e:
            return jsonify({'message': f'Model creation failed: {str(e)}'})


# Route to handle evaluating performance
@app.route('/api/evaluate-performance', methods=['OPTIONS', 'POST'])
def evaluate_performance():
    if request.method == 'OPTIONS':
        # Handle the OPTIONS request
        response = jsonify({})
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        response.headers.add('Access-Control-Allow-Methods', 'POST')
        return response
    elif request.method == 'POST':
        generate_trained_model()
        # Execute the command to evaluate performance
        command = 'python3 testing_model.py'
        working_directory = '../src/'  # Specify the working directory path
        try:
            subprocess.run(command, shell=True, check=True, cwd=working_directory)
            return jsonify({'message': 'Performance evaluation successful'})
        except subprocess.CalledProcessError as e:
            return jsonify({'message': f'Performance evaluation failed: {str(e)}'})


if __name__ == '__main__':
    app.run()
