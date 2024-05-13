from flask import Flask, render_template, jsonify, json

app = Flask(__name__)

@app.route('/')
def dashboard():
    return render_template('index.html')

@app.route('/ping')
def ping():
    return jsonify({"data": "pong"})

@app.route('/patientrecords', methods=["GET"])
def patientrecords():
    with open('static/all-patients-data.json', 'r') as file:
        data = json.load(file)
    return jsonify(data)

@app.route('/emergencycalls', methods=["GET"])
def emergencycalls():
    with open('static/sos-data.json', 'r') as file:
        data = json.load(file)
    return jsonify(data)
 
@app.route('/addalert/<id>', methods=["GET"])
def addalert(id):
    with open('static/all-patients-data.json', 'r') as file:
        data = json.load(file)
        # append and save here
    return id

@app.route('/pushnotification', methods=["GET"])
def pushnotification():
    return ""


@app.route('/generateresponse', methods=["POST"])
def generateresponse():
    return "check"



# run command
# for home Wifi
# flask run -h 192.168.29.183

# for phone hotspot
# flask run -h 192.168.203.222
if __name__ == '__main__':
    app.run(debug=True)

