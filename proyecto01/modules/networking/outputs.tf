output "output_subnet_id" {
  description = "Output de ID de VPC"
  value       = aws_subnet.vnet_public_subnet.id
}

output "output_sg" {
  description = "Output de ID del Security Group"
  value       = aws_security_group.sg_01.id
}