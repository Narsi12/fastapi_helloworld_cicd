pipeline {
    environment {
        imagename = "narsimha2580/jenkinss"
        registryCredential = 'dckr_pat_i3YdTlJbTQkL1TpMUpj5RVCTPz8'
        dockerImage = ''
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
                    sh "docker run ${imagename}:latest"
                }
            }
        }
 
        stage('Deploy Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', registryCredential) {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
