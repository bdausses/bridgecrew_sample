terraform {
  required_version = "~> 1.0.0"
}

provider "aws" {
  region     = "${var.region}"
}

# Find the most recent Ubuntu 20.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create security group
resource "aws_security_group" "allow-all" {
  name        = "bridgecrew-sample-allow-all"
  description = "Allow all inbound/outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# Spin up the sample node
resource "aws_instance" "ubuntu_sample_node" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name      = "${var.key_name}"
  security_groups = ["bridgecrew-sample-allow-all"]
}
