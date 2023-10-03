output "instance_id" {
  value = aws_instance.my_instance.id
}

output "public_dns" {
  value = aws_instance.my_instance.public_dns
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "private_ip" {
  value = aws_instance.my_instance.private_ip
}

output "security_group_id" {
  value = aws_security_group.instance.id
}

output "security_group_name" {
  value = aws_security_group.instance.name
}
