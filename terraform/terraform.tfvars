aws_region          = "ap-south-1"
project_name        = "ivolve"
vpc_cidr            = "10.0.0.0/16"


subnet_cidr         = ["10.0.1.0/24", "10.0.2.0/24"]
az                  = ["ap-south-1a", "ap-south-1b"]
instance_type       = "t3.medium"
key_name            = "jenkins-key"
ami_id              = "ami-020cba7c55df1f615"