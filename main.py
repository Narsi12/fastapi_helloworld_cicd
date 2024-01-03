from fastapi import FastAPI

# Create an instance of the FastAPI class
app = FastAPI()

# Define a route using a decorator
@app.get("/")
def read_root():
    return {"Hello": "World"}

# Run the application using Uvicorn
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
