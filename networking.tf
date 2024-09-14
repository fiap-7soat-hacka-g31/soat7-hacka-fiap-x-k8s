resource "aws_vpc" "fiap_burger_vpc" {
  cidr_block           = "14.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.aws_cluster_name
  }
}



resource "aws_subnet" "fiap_burger_subnet_1a" {
  vpc_id                  = aws_vpc.fiap_burger_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "14.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.aws_cluster_name}-az-1a"
  }
}

resource "aws_subnet" "fiap_burger_subnet_1b" {
  vpc_id                  = aws_vpc.fiap_burger_vpc.id
  availability_zone       = "us-east-1b"
  cidr_block              = "14.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.aws_cluster_name}-az-1b"
  }
}

resource "aws_subnet" "fiap_burger_subnet_1c" {
  vpc_id                  = aws_vpc.fiap_burger_vpc.id
  availability_zone       = "us-east-1c"
  cidr_block              = "14.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.aws_cluster_name}-az-1c"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.fiap_burger_vpc.id
  tags = {
    Name = "eks-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.fiap_burger_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "eks-public-route-table"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.fiap_burger_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.fiap_burger_subnet_1b.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.fiap_burger_subnet_1c.id
  route_table_id = aws_route_table.public_route_table.id
}
