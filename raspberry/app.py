from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def dashboard():
    return render_template('index.html')

@app.route('/alert')
def alert():
    # send alert to nurse phones
    # adds a new member to the sos list
    return "alert!"
 
#  run command
# flask run -h 192.168.29.183
if __name__ == '__main__':
    app.run(debug=False)
