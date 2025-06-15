pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION     = 'ap-south-1'
        AWS_ACCESS_KEY_ID      = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY  = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan -input=false'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Upload State to S3') {
            steps {
                script {
                    sh 'aws s3 cp terraform.tfstate s3://terraformbkt121'
                }
            }
        }
    }

   post {
    always {
        script {
            node {
                cleanWs()
            }
        }
    }
}
