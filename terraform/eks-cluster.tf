resource "aws_eks_cluster" "eks_clusters" {
  name     = "my-eks-clusters"
  role_arn = "arn:aws:iam::872745192558:role/newiam"

  vpc_config {
    subnet_ids = [
      aws_subnet.sani_pub_1.id,
      aws_subnet.sani_pub_2.id,
      aws_subnet.sani_pub_3.id,
    ]
  }
}

resource "aws_subnet" "sani_pub_1" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE1

  tags = {
    Name = "sanivpc-pub-1"
  }
}

resource "aws_subnet" "sani_pub_2" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE2

  tags = {
    Name = "sanivpc-pub-2"
  }
}

resource "aws_subnet" "sani_pub_3" {
  vpc_id                  = aws_vpc.sanivpc.id
  cidr_block              = "10.0.30.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.ZONE3

  tags = {
    Name = "sanivpc-pub-3"
  }
}
