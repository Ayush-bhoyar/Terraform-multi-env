aws_instance_type   = "t2.micro"
ec2_count           = 3
ami_id              = "ami-084568db4383264d4"
vpc_cidr            = "10.2.0.0/16"
availbility_zones   = ["us-east-1a", "us-east-1b"]
subnet_count        = 2
Env                 = "Prod"
aws_s3_bucket       = "prod-ayush-multiinfra-demo-bucket"
aws_region          = "us-east-1"
