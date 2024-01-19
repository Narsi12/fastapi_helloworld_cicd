# FROM public.ecr.aws/lambda/python:3.8
# COPY . ${LAMBDA_TASK_ROOT}
# WORKDIR /app
# ARG DEBIAN_FRONTEND=noninteractive
 
# RUN yum update -y
# RUN yum update -y python3 curl libcom_err ncurses expat libblkid libuuid libmount
# RUN yum install ffmpeg libsm6 libxext6 python3-pip git -y
 
# RUN pip3 install fastapi --target "${LAMBDA_TASK_ROOT}"
# RUN pip3 install mangum --target "${LAMBDA_TASK_ROOT}"
 
# COPY ./requirements.txt ./requirements.txt
# RUN pip install -r ./requirements.txt
# CMD ["app.handler"]


# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI application code into the container
COPY app.py .

# Expose the port that FastAPI will run on
EXPOSE 8080

# Command to run the application using uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]