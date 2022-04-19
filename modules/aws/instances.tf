data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "master" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.generated_key.key_name
  subnet_id                   = aws_subnet.rancher.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.allow_in.id
  ]

  tags = {
    Name = "master"
  }

}

resource "aws_instance" "k3s" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.generated_key.key_name
  subnet_id                   = aws_subnet.rancher.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.allow_in.id
  ]

  tags = {
    Name = "k3s"
  }

}
