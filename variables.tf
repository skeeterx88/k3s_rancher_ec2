variable "aws_access_key" {
  description = "Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "Secret Key"
  type        = string
}

variable "aws_region" {
  description = "Region"
  type        = string
}

variable "aws_location" {
  description = "Location"
  type        = string
}

variable "aws_cidr" {
  description = "VPC Network"
  type        = string
}

variable "aws_subnet_cidr" {
  description = "Subnet network"
  type        = string
}

variable "aws_key_name" {
  description = "Nome da key"
  type        = string
}

variable "aws_instance_type" {
  description = "Tipo da instância"
  type        = string
}