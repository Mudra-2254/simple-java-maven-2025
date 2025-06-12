provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "example" {
  ami           = "ami-0120bca902526ae75"  
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins-Terraform-Instance"
  }
}
