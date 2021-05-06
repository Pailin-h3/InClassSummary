from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel
from MyDB import NewServer
# ^^ Change DB in this line

app = FastAPI()


class Server(BaseModel):
    id: Optional[str] = None
    server_name: str
    max_user: int
    address: str
    wallet: int
    unit: str


@app.get("/")
async def read_root():
    return {"Hello": "World"}

@app.get('/getServers')
async def get():
    new_server = NewServer()
    all_server = new_server.getServers()
    return all_server

@app.get('/getServers/server_id')
async def get_server_by_id(server_id: str):
    new_server = NewServer()
    server = new_server.getServersById(server_id)
    return server

@app.post('/add')
async def add(server: Server):
    new_server = NewServer()
    new_server.create_server(dict(server))
    return {
        "message" : "OK",
        "server name" : server.server_name
    }

@app.delete('/delServersByid/server_id',) 
async def delete(server_id: str):
    new_server = NewServer()
    delresult = new_server.delServersById(server_id)
    return delresult

@app.put('/updateServer')
async def update(server: Server):
    new_server = NewServer()
    updresult = new_server.updateServer(dict(server))
    return updresult



# RUN FastAPI => uvicorn <filename>:<obj name> --reload