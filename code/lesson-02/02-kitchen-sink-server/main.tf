locals {
  project_name = random_pet.pet.id
  server_port  = 8080
  ssh_port     = 22
}

module "bucket" {
  source = "./s3"

  name           = local.project_name
  aws_account_id = data.aws_caller_identity.current.account_id
}

module "dynamo" {
  source = "./dynamo"

  name           = local.project_name
  billing_mode   = "PROVISIONED"
  write_capacity = 10
  read_capacity  = 10
  hash_key       = "id"
  range_key      = "title"

  attributes = [
    {
      name = "id"
      type = "N"
    },
    {
      name = "title"
      type = "S"
    },
    {
      name = "age"
      type = "N"
    }
  ]

  global_secondary_indexes = [
    {
      name               = "TitleIndex"
      hash_key           = "title"
      range_key          = "age"
      projection_type    = "INCLUDE"
      non_key_attributes = ["id"]
      write_capacity     = 10
      read_capacity      = 10
    }
  ]
}

module "server" {
  source = "./ec2"

  name          = local.project_name
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"

  dynamo_table_arn = module.dynamo.arn
  s3_arn           = module.bucket.arn
  busy_box_port    = local.server_port

  ingress_rules = {
    "Serve http port" = {
      from_port   = local.server_port
      to_port     = local.server_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "Allow SSH" = {
      from_port   = local.ssh_port
      to_port     = local.ssh_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress_rules = {
    "Allow all outbound" = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "random_pet" "pet" {
  length = 5
}

data "aws_caller_identity" "current" {}
