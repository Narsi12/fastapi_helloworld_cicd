from fastapi import FastAPI
import mangum
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

handler = mangum.Mangum(app)

if __name__ == "__main__":
   uvicorn.run(app, host="0.0.0.0", port=8080)