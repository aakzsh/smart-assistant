import string
from flask import Flask, render_template, jsonify, json
import random
from datetime import datetime
app = Flask(__name__)
# Import the Python SDK
import google.generativeai as genai

GOOGLE_API_KEY="key"
genai.configure(api_key=GOOGLE_API_KEY)

model = genai.GenerativeModel('gemini-pro')

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
    addalertMethod(id)
    return id

@app.route('/pushnotification', methods=["GET"])
def pushnotification():
    return ""


@app.route('/deletealert/<id>', methods=["GET"])
def deletealert(id):
    with open('static/sos-data.json', 'r') as file:
        data = json.load(file)
        filtered_list = [m for m in data["sos"] if m["id"] != id]
        data["sos"] = filtered_list
        json_string = json.dumps(data, indent=4)
        # Write the JSON string to a text file
        with open("static/sos-data.json", "w") as json_file:
            json_file.write(json_string)
    return "done"


@app.route('/generateresponse', methods=["POST"])
def generateresponse():
    response = model.generate_content("Write a story about a magic backpack in 10 words only.")
    # print(response.text)
    return str(response.text)
    # return jsonify({"assistance": True, "response": "response"})


def addalertMethod(patientid):
    id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    with open('static/all-patients-data.json', 'r') as file:
        data = json.load(file)
        current_timestamp = datetime.now()
        formatted_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")
        newdata = {}
        patientInfo = get_map_by_id(data["data"], patientid)
        newdata["age"] = patientInfo["age"]
        newdata["gender"] = patientInfo["gender"]
        newdata["id"] = id
        newdata["patientName"] = patientInfo["name"]["first"] + " " + patientInfo["name"]["last"]
        newdata["timestamp"] = formatted_timestamp
        newdata["wardnum"] = patientInfo["wardnum"]

        # Write the JSON string to a text file
        with open("static/sos-data.json", 'r') as sosfile:
            s0sdata = json.load(sosfile)
            s0sdata["sos"].append(newdata)
            json_string = json.dumps(s0sdata, indent=4)
            with open("static/sos-data.json", 'w') as new_file:
                new_file.write(json_string)
    return id


def get_map_by_id(list_of_maps, patient_id):
    for map in list_of_maps:
        if map.get('id') == patient_id:
            return map
    return None

# run command
# for home Wifi
# flask run -h 192.168.29.183

# for phone hotspot
# flask run -h 192.168.203.222
if __name__ == '__main__':
    app.run(debug=True)


# remaining
    # push notifs
    # generate response