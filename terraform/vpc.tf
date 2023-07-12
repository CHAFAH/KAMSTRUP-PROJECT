resource "aws_vpc" "sanivpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "spring"
  }
}
resource "aws_subnet" "sani-pub-1" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "sanivpc-pub-1"
  }
}
resource "aws_subnet" "sani-pub-2" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "sanivpc-pub-2"
  }
}


resource "aws_subnet" "sani-pub-3" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "sanivpc-pub-3"
  }
}
resource "aws_subnet" "sani-priv-1" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "sanivpc-priv-1"
  }
}
resource "aws_subnet" "sani-priv-2" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "sanivpc-priv-2"
  }
}
resource "aws_subnet" "sani-priv-3" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "sanivpc-priv-3"
  }
}
resource "aws_internet_gateway" "sani-IGW" {
  vpc_id = aws_vpc.sanivpc.id

  tags = {
    Name = "sani-igw"
  }
}

resource "aws_route_table" "saniRT" {
  vpc_id = aws_vpc.sanivpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sani-IGW.id
  }

  tags = {
    Name = "sani-PUB-RT"
  }
}
resource "aws_route_table_association" "sani-pub-1a" {
  subnet_id      = aws_subnet.sani-pub-1.id
  route_table_id = aws_route_table.saniRT.id
}
resource "aws_route_table_association" "sani-pub-1b" {
  subnet_id      = aws_subnet.sani-pub-2.id
  route_table_id = aws_route_table.saniRT.id
}
resource "aws_route_table_association" "sani-pub-1c" {
  subnet_id      = aws_subnet.sani-pub-3.id
  route_table_id = aws_route_table.saniRT.id
}
