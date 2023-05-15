variable "region" {
  description = "The AWS region to deploy the infrastructure in."
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  default     = "t2.medium"
}

variable "key_pair_name" {
  description = "The name of the SSH key pair to use for the EC2 instance."
  default     = "test"
}
