terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "cloud-tej"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  #access_key = "AKIAX3OD6IVG3SETPFDR"
  #secret_key = "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"
}

resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = ["subnet-0b2867b08a896e992","subnet-0001a9bd1b9807a67"]

  tags = {
    Name = "My DB subnet group"
  }

}


resource "aws_db_instance" "default" {
  allocated_storage        = 20
  db_name                  = "mydb"
  engine                   = "mysql"
  engine_version           = "5.7"
  instance_class           = "db.t3.micro"
  username                 = "mysqladmin"
  password                 = "Password.12345"
  parameter_group_name     = "default.mysql5.7"
  skip_final_snapshot      = true
}