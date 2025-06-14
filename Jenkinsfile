pipeline {
    agent any

    environment {
        TF_VAR_aws_access_key = credentials('aws-access-key-id')      // From Jenkins credentials
        TF_VAR_aws_secret_key = credentials('aws-secret-access-key')  // From Jenkins credentials
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Mudra-2254/simple-java-maven-2025.git'
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
