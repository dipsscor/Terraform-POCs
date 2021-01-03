terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

#Create a VPC
resource "aws_vpc" "vpc_example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink   = "false"
  instance_tenancy     = "default"
  tags = {
    Name = "vpc_example"
  }
}

#Create a public subnet
resource "aws_subnet" "vpc_example-subnet-public-1" {
  vpc_id                  = aws_vpc.vpc_example.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "us-east-1a"
  tags = {
    Name = "vpc_example-subnet-public-1"
  }
}


#Create another public subnet
resource "aws_subnet" "vpc_example-subnet-public-2" {
  vpc_id                  = aws_vpc.vpc_example.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "us-east-1b"
  tags = {
    Name = "vpc_example-subnet-public-2"
  }
}


#Create a private subnet
resource "aws_subnet" "vpc_example-subnet-private-1" {
  vpc_id                  = aws_vpc.vpc_example.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "vpc_example-subnet-private-1"
  }
}


#Create a private subnet
resource "aws_subnet" "vpc_example-subnet-private-2" {
  vpc_id                  = aws_vpc.vpc_example.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "vpc_example-subnet-private-2"
  }
}


#Create an internet Gateway
resource "aws_internet_gateway" "igw-example" {
  vpc_id = aws_vpc.vpc_example.id
  tags = {
    Name = "igw-example"
  }
}

