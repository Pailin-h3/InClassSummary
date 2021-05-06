from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello'

@app.route('/about')
def about():
    return {
        "zzzzz" : "aaa",
        "message" : "from",
        "about" : "is HERE!!"
    }

# set server flask use

# set FLASK_APP = {filename.py}
# flask run => to run server