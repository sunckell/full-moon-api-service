variable "aws_access_key" {
  description = "The AWS access key id credential"
}

variable "aws_secret_key" {
  description = "The AWS secret access key credential"
}

variable "aws_region" {
  description = "The AWS region to create things in."
}

variable "vpc_id" {
  description = "The vpc id in the account"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "asg_min" {
  description = "Min numbers of servers in Auto Scaling Group"
  default     = "1"
}

variable "asg_max" {
  description = "Max numbers of servers in Auto Scaling Group"
  default     = "4"
}

variable "asg_desired" {
  description = "Desired numbers of servers in Auto Scaling Group"
  default     = "2"
}
