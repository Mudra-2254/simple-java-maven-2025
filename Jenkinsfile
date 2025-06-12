pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "krisha/docker-app:v1"
        CONTAINER_NAME = "my-app"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/yourrepo/project.git' // Replace with your repo
            }
        }
        stage('Build Docker Image') {
            steps {
           sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p 80:80 $DOCKER_IMAGE'
            }
        }
    }
}
