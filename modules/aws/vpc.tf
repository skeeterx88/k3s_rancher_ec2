resource "aws_vpc" "cluster" {
  cidr_block = var.cidr
}

resource "aws_subnet" "rancher" {
  vpc_id     = aws_vpc.cluster.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "k3s"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.cluster.id
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.cluster.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.rancher.id
  route_table_id = aws_route_table.route.id
}