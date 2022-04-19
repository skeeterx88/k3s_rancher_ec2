variable "access_key" {
  description = "Access Key"
  type        = string
}

variable "secret_key" {
  description = "Secret Key"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

variable "cidr" {
  description = "VPC Network"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet network"
  type        = string
}

variable "key_name" {
  description = "Nome da key"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância"
  type        = string
}