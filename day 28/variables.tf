variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "region-name"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-***********"
}

variable "instance_type" {
  description = "Instance type for EC2"
  default     = "t2.micro"
}


variable "db_username" {
  description = "Database username"
  default     = "******"
}

variable "db_password" {
  description = "Database password"
  default     = "********"
}
