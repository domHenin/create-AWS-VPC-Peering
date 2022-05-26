resource "aws_vpc" "vpc_alpha" {
  # provider = aws.region-cloud_user
  provider   = aws.region-a
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc_alpha"
  }
}


resource "aws_vpc" "vpc_bravo" {
  # provider = aws.region-cloud_user
  provider   = aws.region-b
  cidr_block = "172.31.0.0/16"

  tags = {
    "Name" = "vpc_bravo"
  }
}


resource "aws_subnet" "subnet_alpha" {
  # provider = aws.region-cloud_user
  provider   = aws.region-a
  vpc_id     = aws_vpc.vpc_alpha.id
  cidr_block = "10.0.0.0/24"

  tags = {
    "Name" = "subnet_alpha"
  }
}


resource "aws_subnet" "subnet_bravo" {
  # provider = aws.region-cloud_user
  provider   = aws.region-b
  vpc_id     = aws_vpc.vpc_bravo.id
  cidr_block = "172.31.0.0/24"

  tags = {
    "Name" = "subnet_bravo"
  }
}
