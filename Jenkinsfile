pipeline {
    agent any

   environment {
    AWS_CREDENTIALS = credentials('my-aws-creds-id') // must be of type "AWS credentials"
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
                sh 'terraform apply -auto-approve -var-file="terraform.tfvars"'

            }
        }
    }
}
