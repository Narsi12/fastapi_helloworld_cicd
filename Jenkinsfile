pipeline {
    environment {
        imagename = "narsimha2580/jenkinss"
        registryCredential = 'dckr_pat_i3YdTlJbTQkL1TpMUpj5RVCTPz8'
        dockerImage = ''
        containerName = 'my-container'
    }
 
    agent any
 
    stages {
        stage('Cloning Git') {
            steps {
                git([url: 'https://github.com/Narsi12/fastapi_helloworld_cicd.git', branch: 'main'])
            }
        }
 
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build "${imagename}:latest"
                }
            }
        }
 
        stage('Running image') {
            steps {
                script {
                    sh "docker run -d --name ${containerName} ${imagename}:latest"
                    // Perform any additional steps needed while the container is running
                }
            }
        }

        stage('Stop and Remove Container') {
            steps {
                script {
                    sh "docker stop ${containerName} || true"  // Stop the container, ignoring errors if it's not running
                    sh "docker rm ${containerName} || true"    // Remove the container, ignoring errors if it doesn't exist
                }
            }
        }
 
        stage('Deploy Image') {
    steps {
        script {
            // Login to Docker Hub
            sh "docker login -u narsimha2580 -p Narsimha123@#$"

            // Push the image
            sh "docker push ${imagename}:latest"
        }
    }
}

        }
    }
}

 
