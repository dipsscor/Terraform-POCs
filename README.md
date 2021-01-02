# Terraform-POCs
Samples of Terraform scripts for infrastructure provisioning on AWS

# Terraform Installation
Use Chocolatey to install latest version of terraform on windows

# AWSCLI installation
Configure AWSCLI using "AWS configure" command and provide the credentials:

        $ aws configure
        AWS Access Key ID [None]: <your-access-key>
        AWS Secret Access Key [None]: <your-secret-key>
        Default region name [None]: us-west-2
        Default output format [None]: json

# Start Terraform projects:

        1. create directories for grouping your terraform scripts.
        2. create a terraform script in the directory like:
        
                terraform {  -- > Required for Terraform to know which providers to download from Terraform Registry like AWS provider
                  required_providers {
                    aws = {
                      source  = "hashicorp/aws"
                      version = "~> 2.70"
                    }
                  }
                }

                provider "aws" {  --> Specifying the provider
                  profile = "default"  --> Refer to default AWS credentials that would be used by terraform in .awsconfig file in local
                  region  = "us-west-2" --> the region to provison the infrastructre.
                }

                resource "aws_instance" "example" { --> Specifying the resource
                  ami           = "ami-830c94e3"
                  instance_type = "t2.micro"
                }
  
          3. execute command "terraform init" to initialize the directory
          4. execute "terraform fmt"  --> format the configuration
          5. execute "terraform validate" --> validate the configuration
          6. execute "terraform apply" --> apply the configuration
 
# Remove all the infrastructure provisioned on cloud

          execute "terraform destroy" --> remove all configuartions step by step.
        
# References:
https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
