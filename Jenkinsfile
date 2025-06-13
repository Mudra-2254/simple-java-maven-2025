pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nginx"
        CONTAINER_NAME = "my-app"
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')     // Must exist in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key') // Must exist in Jenkins
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Mudra-2254/simple-java-maven-2025.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                    if [ "$(docker ps -aq -f name=${CONTAINER_NAME})" ]; then
                        docker rm -f ${CONTAINER_NAME}
                    fi
                    docker run -d --name ${CONTAINER_NAME} -p 80:80 ${DOCKER_IMAGE}
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}

