provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "webapp_repo" {
  name = "webapp-repo"
}

resource "aws_ecr_repository" "mysql_repo" {
  name = "mysql-repo"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "clo835-key"
  public_key = file("${path.module}/clo835-key.pub")
}

resource "aws_instance" "app_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "clo835-ec2-instance"
  }
}
