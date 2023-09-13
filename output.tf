

output "mgmt_subnet_id" {
  description = "ID of the subnet where the EC2 instance is located"
  value       = aws_subnet.mgmt_subnet.id
}

output "subnet_app_id" {
  description = "ID of the subnet where the EC2 instance is located"
  
value       = aws_subnet.subnet_app.id
}

output "subnet_app1_id" {
  description = "ID of the subnet where the EC2 instance is located"
  
value       = aws_subnet.subnet_app1.id
}

  