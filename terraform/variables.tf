variable "region" {
  type = string
  default = "eu-central-1"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "aws_key_name" {
  description = "Name of the existing AWS key pair"
  type        = string
}

variable "ssh_private_key" {
  description = "Content of the SSH private key"
  type        = string
}