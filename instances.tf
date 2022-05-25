data "aws_ssm_parameter" "linux_ami_alpha" {
  # provider = aws.region-cloud_user
  provider = aws.region-a
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "aws_ssm_parameter" "linux_ami_bravo" {
  # provider = aws.region-cloud_user
  provider = aws.region-b
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "container_alpha" {
  # provider                    = aws.region-cloud_user
  provider                    = aws.region-a
  ami                         = data.aws_ssm_parameter.linux_ami_alpha.value
  instance_type               = var.instance_type
  associate_public_ip_address = true
  # vpc_security_group_ids = []
  subnet_id = aws_subnet.subnet_alpha.id

  tags = {
    "Name" = "container_alpha"
  }
}

resource "aws_instance" "container_bravo" {
  # provider                    = aws.region-cloud_user
  provider                    = aws.region-b
  ami                         = data.aws_ssm_parameter.linux_ami_bravo.value
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet_bravo.id

  tags = {
    Name = "container_bravo"
  }
}