from .db import db
from fastapi import FastAPI

app = FastAPI()

@app.get("/user/{id}")
def get_user_info(id: int):
    user = db[id]
    return {"name": user["user_name"], "status":user["status"]}
