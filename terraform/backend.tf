terraform {
  backend "s3" {
    bucket         = "jenkins12345-terraform-state"
    key            = "cloud-devops/terraform.tfstate"
    region         = "ap-south-1"
    //dynamodb_table = "terraform-state-lock"
  }
}


