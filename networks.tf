# Create VPC_A - Private VPC
resource "aws_vpc" "vpc_priv" {
  provider             = aws.region-cloud_user
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "devops-junction_private"
  }
}

# Create VPC_B Public VPC
resource "aws_vpc" "vpc_pub" {
  provider             = aws.region-cloud_user
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "devops-junction_public"
  }
}

# Create AWS Subnet - Private Sub
resource "aws_subnet" "subnet_priv" {
  provider   = aws.region-cloud_user
  vpc_id     = aws_vpc.vpc_priv.id
  cidr_block = "10.0.1.0/24"

  tags = {
    "Name" = "devops-junction_priv_subnet"
  }
}

resource "aws_subnet" "subnet_pub" {
  provider   = aws.region-cloud_user
  vpc_id     = aws_vpc.vpc_pub.id
  cidr_block = "192.168.1.0/24"

  tags = {
    "Name" = "devops-junction_pub_subnet"
  }
}


# Create AWS Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   provider = aws.region-cloud_user
#   vpc_id = aws_vpc.vpc_pub.id

#   tags = {
#       Name = "allow traffic"
#   }
# }

# Create AWS Route Table
# resource "aws_route_table" "devop_junction_rt" {
#   provider = aws.region-cloud_user
#   vpc_id   = aws_vpc.vpc_pub.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     # gateway_id = aws_internet_gateway.igw
#   }

#   # route {
#   #     cidr_block = "192.168.1.0/24"
#   # }

#   lifecycle {
#     ignore_changes = all
#   }

#   tags = {
#     "Name" = "Public Route Table"
#   }
# }