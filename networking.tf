resource "aws_vpc" "fiap_burger_vpc" {
  cidr_block = "14.0.0.0/16"
  tags = {
    Name = "fiap_burger_k8s"
  }
}

resource "aws_subnet" "fiap_burger_subnet_1a" {
  vpc_id            = aws_vpc.fiap_burger_vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "14.0.0.0/24"
  tags = {
    Name = "${var.aws_cluster_name}-az-1a"
  }
}

resource "aws_subnet" "fiap_burger_subnet_1b" {
  vpc_id            = aws_vpc.fiap_burger_vpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "14.0.1.0/24"
  tags = {
    Name = "${var.aws_cluster_name}-az-1b"
  }
}

resource "aws_subnet" "fiap_burger_subnet_1c" {
  vpc_id            = aws_vpc.fiap_burger_vpc.id
  availability_zone = "us-east-1c"
  cidr_block        = "14.0.2.0/24"
  tags = {
    Name = "${var.aws_cluster_name}-az-1c"
  }
}
