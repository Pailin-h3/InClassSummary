from flask import Flask, request, jsonify
from MyDB import NewServer

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello World!!'

@app.route('/getServers')
def get():
    new_server = NewServer()
    all_server = new_server.getServers()
    return jsonify(all_server)

@app.route('/getServersByid/<int:server_id>')
def get_server_by_id(server_id):
    new_server = NewServer()
    server = new_server.getServersById(server_id)
    return jsonify(server)

@app.route('/add', methods=['POST'])
def add():
    server = request.get_json()
    new_server = NewServer()
    new_server.create_server(server)

    return {
        "message" : "OK",
        "server name" : server["server_name"]
    }

@app.route('/delServersByid/<int:server_id>', methods=['DELETE'])
def delete(server_id):
    new_server = NewServer()
    delresult = new_server.delServersById(server_id)
    return delresult

@app.route('/updateServer', methods=['PATCH'])
def update():
    server = request.get_json()
    new_server = NewServer()
    updresult = new_server.updateServer(server)
    return updresult

# set server flask use

# set FLASK_APP = {filename.py}
# set FLASK_ENV = development
# flask run => to run server