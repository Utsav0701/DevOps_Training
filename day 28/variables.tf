variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0ff591da048329e00"
}

variable "instance_type" {
  description = "Instance type for EC2"
  default     = "t2.micro"
}


variable "db_username" {
  description = "Database username"
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  default     = "password123"
}
