output "id" {
  value = aws_instance.example.id
}

output "state" {
  value = aws_instance.example.instance_state
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}
