### Root Module

# main.tf
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source= "./aws-infra/modules/vpc"
  vpc_cidr= var.vpc_cidr
  subnet_count= var.subnet_count
  availbility_zones= var.availbility_zones
  Env= var.Env
}

module "ec2" {
  source= "./aws-infra/modules/ec2"
  ami_id= var.ami_id
  aws_instance_type= var.aws_instance_type
  ec2_count= var.ec2_count
  subnet_ids= module.vpc.subnet_ids
  Env= var.Env
  
}

module "s3" {
  source= "./aws-infra/modules/s3"
  bucketname= var.aws_s3_bucket
  aws_s3_bucket_region= var.aws_region
  Env= var.Env
}
