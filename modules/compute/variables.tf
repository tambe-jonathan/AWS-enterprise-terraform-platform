# modules/compute/variables.tf

variable "vpc_id" {
  type        = string
  description = "The VPC ID where compute resources will reside"
}

variable "private_subnets" {
  type        = list(string)
}

variable "app_sg_id" {
  type        = string
}

variable "target_group_arn" {
  type        = string
}

variable "ami_id" {
  type        = string
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}
