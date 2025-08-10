
resource "aws_instance" "webserver" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.Dev-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.web-security.id]
  associate_public_ip_address = true

  tags = {
    Name = var.name_tag
  }
}

resource "aws_security_group" "web-security" {
  vpc_id = aws_vpc.Dev.id

  tags = {
    Name = var.web_security_name
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web-security.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web-security.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web-security.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}


resource "aws_vpc" "Dev" {
  cidr_block = var.vpc_cidr

  tags = {
    name = var.vpc_name
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Dev.id
}

resource "aws_subnet" "Dev-public-subnet" {
  vpc_id     = aws_vpc.Dev.id
  cidr_block = var.public_subnet_cidr

  tags = {
    name = var.subnet_name
  }
}


resource "aws_route_table" "Dev-public-route" {
  vpc_id = aws_vpc.Dev.id

  tags = {
    "name" = var.route_table_name
  }


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

resource "aws_route_table_association" "route1" {
  route_table_id = aws_route_table.Dev-public-route.id
  subnet_id      = aws_subnet.Dev-public-subnet.id
}
