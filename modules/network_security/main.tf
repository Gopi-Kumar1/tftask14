# ---------- SSH SG ----------
resource "aws_security_group" "ssh" {
  name        = var.ssh_sg_name
  description = "Allow SSH from allowed IP ranges"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.ssh_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  for_each = toset(var.allowed_ip_range)

  security_group_id = aws_security_group.ssh.id
  cidr_ipv4         = each.value
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

# ---------- Public HTTP SG (used by the ALB) ----------
resource "aws_security_group" "public_http" {
  name        = var.public_http_sg_name
  description = "Allow HTTP from allowed IP ranges"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.public_http_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "public_http" {
  for_each = toset(var.allowed_ip_range)

  security_group_id = aws_security_group.public_http.id
  cidr_ipv4         = each.value
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# ---------- Private HTTP SG (used by the instances) ----------
resource "aws_security_group" "private_http" {
  name        = var.private_http_sg_name
  description = "Allow HTTP only from the public HTTP security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.private_http_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "private_http" {
  security_group_id            = aws_security_group.private_http.id
  referenced_security_group_id = aws_security_group.public_http.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

# ---------- Egress (Terraform removes AWS's default allow-all, so we add it back) ----------
resource "aws_vpc_security_group_egress_rule" "all" {
  for_each = {
    ssh          = aws_security_group.ssh.id
    public_http  = aws_security_group.public_http.id
    private_http = aws_security_group.private_http.id
  }

  security_group_id = each.value
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}