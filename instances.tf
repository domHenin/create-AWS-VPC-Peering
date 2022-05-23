data "aws_ami" "linux_ami" {
  provider    = aws.region-cloud_user
  owners      = ["137112412989"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }
}

resource "aws_instance" "linux_container" {
  provider      = aws.region-cloud_user
  count         = 1
  instance_type = "t2.micro"
  ami           = data.aws_ami.linux_ami.id
  subnet_id     = aws_subnet.subnet_pub.id
#   depends_on    = [aws_internet_gateway.igw]
  #   associate_public_ip_address = true

  #   connection {
  #     type = "ssh"
  #     user = "admin"
  #   }

  user_data = file("files/startup_script.bash")

  tags = {
    "Name" = "devops-junction_instance-Public"
  }
}