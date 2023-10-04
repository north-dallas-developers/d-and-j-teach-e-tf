terraform {
  required_version = ">= 1.5.0, < 2.0.0"
  required_providers {
    aws   = { source = "hashicorp/aws" }
    tls   = { source = "hashicorp/tls" }
    local = { source = "hashicorp/local" }
  }
}
