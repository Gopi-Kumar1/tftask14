aws_region = "eu-west-1"

vpc_name         = "cmtr-35arqg4r-vpc"
vpc_cidr         = "10.10.0.0/16"
igw_name         = "cmtr-35arqg4r-igw"
route_table_name = "cmtr-35arqg4r-rt"

public_subnets = {
  a = {
    name              = "cmtr-35arqg4r-subnet-public-a"
    cidr_block        = "10.10.1.0/24"
    availability_zone = "eu-west-1a"
  }
  b = {
    name              = "cmtr-35arqg4r-subnet-public-b"
    cidr_block        = "10.10.3.0/24"
    availability_zone = "eu-west-1b"
  }
  c = {
    name              = "cmtr-35arqg4r-subnet-public-c"
    cidr_block        = "10.10.5.0/24"
    availability_zone = "eu-west-1c"
  }
}

allowed_ip_range     = ["18.153.146.156/32", "203.170.48.2/32"]
ssh_sg_name          = "cmtr-35arqg4r-ssh-sg"
public_http_sg_name  = "cmtr-35arqg4r-public-http-sg"
private_http_sg_name = "cmtr-35arqg4r-private-http-sg"

launch_template_name = "cmtr-35arqg4r-template"
instance_type        = "t3.micro"
asg_name             = "cmtr-35arqg4r-asg"
asg_desired_capacity = 2
asg_min_size         = 2
asg_max_size         = 2
lb_name              = "cmtr-35arqg4r-lb"
target_group_name    = "cmtr-35arqg4r-tg"