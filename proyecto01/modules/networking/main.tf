# Creación de la VPC
resource "aws_vpc" "vnet_paris" {
  cidr_block = var.cidr_vnet

  tags = {
    Name = "Vnet_Paris"
  }
}

# Creación de la Subnet Publica
resource "aws_subnet" "vnet_public_subnet" {
  vpc_id                  = aws_vpc.vnet_paris.id
  cidr_block              = var.cidr_public_subnet
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnetParis"
  }
}

# Creación de la Subnet Privada
resource "aws_subnet" "vnet_private_subnet" {
  vpc_id     = aws_vpc.vnet_paris.id
  cidr_block = var.cidr_private_subnet

  tags = {
    Name = "PrivateSubnetParis"
  }
}

# Creación de la puerta de enlace
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vnet_paris.id

  tags = {
    Name = "InternetGW"
  }
}

# Creación de la route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vnet_paris.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
}

# Creación de la asociacion entre la route table y la vpc
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.vnet_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Creación del Sec. Group
resource "aws_security_group" "sg_01" {
  name        = "SecurityGroup01"
  description = "Allow SSH inbound traffic and ALL egress traffic"
  vpc_id      = aws_vpc.vnet_paris.id

  dynamic "ingress" {
    for_each = var.ingress_ports_list_module
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr_module]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SecurityGroup01"
  }
}

# Creación del Classic LB
resource "aws_elb" "lb01" {
  name                        = "lb01"
  connection_draining         = true
  connection_draining_timeout = 300
  cross_zone_load_balancing   = true
  idle_timeout                = 60
  subnets                     = [aws_subnet.vnet_public_subnet.id]
  instances                   = var.instance_pool_id
  security_groups             = [aws_security_group.sg_01.id]
  #tags                        = {}
  #tags_all                    = {}

  health_check {
    healthy_threshold   = 10
    interval            = 5
    target              = "HTTP:80/index.html"
    timeout             = 2
    unhealthy_threshold = 2
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "http"
    ssl_certificate_id = null
  }

  depends_on = [aws_security_group.sg_01]
}