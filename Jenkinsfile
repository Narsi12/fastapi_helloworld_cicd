pipeline {
    environment {
        imagename = "narsimha2580/jenkinss"
        dockerImage = ''
        containerName = 'my-container'
        dockerHubCredentials = 'docker-hub-credentials'
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
                    // Use Jenkins build number as the Docker image tag
                    def imageTag = "${imagename}:${BUILD_NUMBER}"
                    dockerImage = docker.build imageTag
                }
            }
        }

        stage('Running image') {
            steps {
                script {
                    sh "docker run -d --name ${containerName} ${dockerImage.id}"
                    // Perform any additional steps needed while the container is running
                }
            }
        }

        stage('Stop and Remove Container') {
            steps {
                script {
                    sh "docker stop ${containerName} || true"
                    sh "docker rm ${containerName} || true"
                }
            }
        }

        stage('Deploy Image') {
            steps {
                script {
                    // Use Jenkins credentials for Docker Hub login
                    withCredentials([usernamePassword(credentialsId: dockerHubCredentials, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"

                        // Push the image
                        sh "docker push ${dockerImage.id}"
                    }
                }
            }
        }

        stage('Trigger ManifestUpdate') {
            steps {
                echo "Triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
            }
        }
    }
}
