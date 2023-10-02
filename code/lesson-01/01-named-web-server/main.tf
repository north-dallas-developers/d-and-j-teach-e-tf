terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

locals {
  name = "nddg-example"
  port = 8080
}


resource "aws_instance" "example" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, Eric!" > index.html
              nohup busybox httpd -f -p ${local.port} &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = local.name
  }
}

resource "aws_security_group" "instance" {

  name = "${local.name}-sg"

  ingress {
    from_port   = local.port
    to_port     = local.port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
