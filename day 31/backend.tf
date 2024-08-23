terraform {
  backend "s3" {
    bucket         = "utsav-terraform-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "utsav-dynamodb-table"
  }
}