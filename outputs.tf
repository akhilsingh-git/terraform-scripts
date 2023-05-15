output "instance_public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the Ubuntu instance."
}

output "instance_public_dns" {
  value       = aws_instance.example.public_dns
  description = "The public DNS of the Ubuntu instance."
}

