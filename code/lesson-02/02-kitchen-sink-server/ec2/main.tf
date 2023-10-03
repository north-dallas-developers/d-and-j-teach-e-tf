locals {
  user_data_rendered = templatefile("${path.module}/user_data.tpl", {
    dynamo_table_arn = var.dynamo_table_arn,
    s3_arn           = var.s3_arn,
    server_port      = var.busy_box_port
  })
}
resource "aws_instance" "my_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data                   = local.user_data_rendered
  user_data_replace_on_change = true

  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "instance" {
  name = "${var.name}-sg"

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
