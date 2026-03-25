from .db import db
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
CORSMiddleware,
allow_origins=["*"],
allow_credentials=True,
allow_methods=["*"],
allow_headers=["*"],
)

@app.get("/user/{id}")
def get_user_info(id: int):
    user = db[id]
    return {"name": user["user_name"], "status":user["status"]}
