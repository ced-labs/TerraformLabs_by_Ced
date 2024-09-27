output "ec2_pool_id" {
  description = "ID de las instancias"
  value       = aws_instance.ec2_pool[*].id
}

