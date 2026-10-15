variable "vpc_id" {
  description = "VPC ID used by the target group"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the ALB and the Auto Scaling group"
  type        = list(string)
}

variable "ssh_sg_id" {
  description = "ID of the SSH security group"
  type        = string
}

variable "public_http_sg_id" {
  description = "ID of the public HTTP security group (attached to the ALB)"
  type        = string
}

variable "private_http_sg_id" {
  description = "ID of the private HTTP security group (attached to instances)"
  type        = string
}

variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling group"
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances"
  type        = number
}

variable "lb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
}