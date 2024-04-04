from flask import Flask

app = Flask(__name__)

@app.route('/')
def dashboard():
    return 'show the nurse dashboard here'

@app.route('/alert')
def alert():
    # send alert to nurse phones
    return "alert!"

@app.route('/edit')
def edit():
    # edit patient details from here
    return "patient details edit"

# @app.route('/nlp')
# def edit():
#     # get prompt, generate and return response
#     return "response"

if __name__ == '__main__':
    app.run(debug=False)
