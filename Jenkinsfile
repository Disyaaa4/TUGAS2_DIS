pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'dianaiffatul/tugas_2'
        REGISTRY = 'index.docker.io/v1'
        REGISTRY_CREDENTIALS = 'your-registry-credentials-id'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("$IMAGE_NAME")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://$REGISTRY", "$REGISTRY_CREDENTIALS") {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}