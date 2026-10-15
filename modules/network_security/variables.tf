variable "vpc_id" {
  description = "ID of the VPC where the security groups are created"
  type        = string
}

variable "allowed_ip_range" {
  description = "List of CIDR blocks allowed to reach SSH and HTTP"
  type        = list(string)
}

variable "ssh_sg_name" {
  description = "Name of the SSH security group"
  type        = string
}

variable "public_http_sg_name" {
  description = "Name of the public HTTP security group"
  type        = string
}

variable "private_http_sg_name" {
  description = "Name of the private HTTP security group"
  type        = string
}