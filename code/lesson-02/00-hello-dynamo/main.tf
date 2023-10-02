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

resource "aws_dynamodb_table" "example" {
  name         = var.name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  range_key    = var.range_key

  attribute {
    name = "id"
    type = "N"
  }
  attribute {
    name = "title"
    type = "S"
  }
  attribute {
    name = "age"
    type = "N"
  }

  global_secondary_index {
    name               = "TitleIndex"
    hash_key           = "title"
    projection_type    = "INCLUDE"
    range_key          = "age"
    non_key_attributes = ["id"]
  }

  tags = {
    "Name" = var.name
  }
}