variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}


variable "ami" {
  type = string
  description = "amazon linux"
  default = "ami-0144277607031eca2"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "Web-server"
}

variable "vpc_cidr" {
   type        = string
   description = "vpc cider valve"
   default     = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "Development-vpc"
}

variable "IGW_Name" {
  default = "Development-IGW"
}

variable "subnet_name" {
  default = "Development-public-subnet"
}


variable "route_table_name" {
  default = "Development-public-route"
}


variable "web_security_name" {
  default = "web_security"
}

variable "public_subnet_cidr" {
  type = string
  description = "public subnet cidr valaue"
  default = "10.0.0.0/24"
}