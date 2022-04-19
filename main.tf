module "aws" {
  source = "./modules/aws"

  access_key    = var.aws_access_key
  secret_key    = var.aws_secret_key
  region        = var.aws_region
  location      = var.aws_location
  cidr          = var.aws_cidr
  subnet_cidr   = var.aws_subnet_cidr
  key_name      = var.aws_key_name
  instance_type = var.aws_instance_type
}