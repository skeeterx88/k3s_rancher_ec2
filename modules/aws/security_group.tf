resource "aws_security_group" "allow_in" {
  name        = "allow_in"
  description = "Allow Entrada de portas"
  vpc_id      = aws_vpc.cluster.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    protocol         = "tcp"
    to_port          = 80
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    protocol         = "tcp"
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "RANCHER01"
    from_port        = 2376
    protocol         = "tcp"
    to_port          = 2376
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "RANCHER02"
    from_port        = 6443
    protocol         = "tcp"
    to_port          = 6443
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "NODES"
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = [aws_vpc.cluster.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "k3s"
  }

  lifecycle {
    create_before_destroy = true
  }

}