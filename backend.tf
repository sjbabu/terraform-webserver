terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket-789898"         
    key            = "terraform/dev/terraform.tfstate"  
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"           
    encrypt        = true
  }
}
