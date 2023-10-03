variable "name" {
  description = "the instance name"
  type        = string
}

variable "ami" {
  description = "the ami to use"
  type        = string
}

variable "instance_type" {
  description = "the ec2 instance type"
  type        = string
}

variable "dynamo_table_arn" {
  description = "the arn of the dynamo table"
  type        = string
}

variable "s3_arn" {
  description = "the arn of the s3 bucket"
  type        = string
}

variable "ingress_rules" {
  description = "Ingress rules to create"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
  }))
}

variable "egress_rules" {
  description = "Egress rules to create"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
  }))
}

variable "busy_box_port" {
  description = "the port to host busybox on"
  type        = number
}

variable "user_data_replace_on_change" {
  description = "destroy and recreate ec2 on user_data change"
  type        = bool
  default     = true
}
