# to load app type in conda => uvicorn {filename}:{appname} --reload
# apiJSON(transfer code to json) => http://127.0.0.1:8000/openapi.json
# UI => swagger => http://127.0.0.1:8000/docs
#       uidoc => http://127.0.0.1:8000/redoc

from fastapi import FastAPI, Depends, HTTPException, status
from typing import Optional, List
from pydantic import BaseModel
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm

app = FastAPI() # appname
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

class Item(BaseModel):  # they said you should separade ItemIn and ItemOut
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None
    is_offer: Optional[bool] = None
    tags: List[str] = []

@app.get('/')
def read_root():
    return {"Hello": "World"}

@app.get('/item/{item_id}')  #http://127.0.0.1:8000/item/8?q=eiei
def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}

@app.put('/items/{item_id}')
def update_item(item_id: int, item: Item):
    return {"item_id": item_id, 
        "name": item.name, 
        "price": item.price
    }

@app.post('/add_item/', response_model=Item) # can return model
async def create_item(item: Item): # async => dont wait other running to be done
    item.tax = item.price * 0.07
    return item

# SECURYTY
# Authentication
fake_user_db = {
    "johndoe": {
        "username": "johndoe",
        "full_name": "John Doe",
        "email": "johndoe@example.com",
        "hashed_password": "fakehashedsecret",
        "disabled": False,
    },
    "alice": {
        "username": "alice",
        "full_name": "Alice Wonderson",
        "email": "alice@example.com",
        "hashed_password": "fakehashedsecret2",
        "disabled": True,
    },
}
def fake_hash_pasword(password: str):
    return "fakehashed" + password

class User(BaseModel):
    username: str
    email: Optional[str] = None
    full_name: Optional[str] = None
    disabled: Optional[bool] = None
class UserInDB(User):
    hashed_password: str
def fake_decode_token(token):
    return User(
        username=token+"fakeuser"
    )

async def get_current_user(token: str = Depends(oauth2_scheme)):
    user = fake_decode_token(token)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid authentication",
            headers={"WWW-Authenticate": "Bearer"},
        )
    return user
async def get_current_active_user(current_user: User = Depends(get_current_user)):
    if current_user.disabled:
        raise HTTPException(status_code=400, detail="Inactive user")
    return current_user
def get_user(db, username: str):
    if username in db:
        user_dict = db[username]
        return UserInDB(**user_dict)
def fake_decode_token(token):
    user = get_user(fake_user_db, token)
    return user

@app.post('/token') # must be tokenURL
async def login(from_data: OAuth2PasswordRequestForm = Depends()): #no need to check
    user_dict = fake_user_db.get(from_data.username)
    if not user_dict:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    user = UserInDB(**user_dict)
    hashed_password = fake_hash_pasword(from_data.password)
    if not hashed_password == user.hashed_password:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    return {"access_token": user.username, "token_type": "Bearer"}
@app.get('/user/me')
async def read_user_me(current_user: User = Depends(get_current_user)):
    return current_user
@app.get('/authtest')
async def read_token(token: str = Depends(oauth2_scheme)): # if logged in token is str, if not token is null(not permit to access)
    return {"token": token}

