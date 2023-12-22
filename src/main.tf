terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.prod.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "subnet"
  }
}

