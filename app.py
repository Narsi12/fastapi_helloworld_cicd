from fastapi import FastAPI
import mangum
import uvicorn
#test comment
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/jenkins")
def read_git():
    return {"Hello": "jenkins"}

handler = mangum.Mangum(app)

if __name__ == "__main__":
   uvicorn.run(app, host="0.0.0.0", port=8080)
