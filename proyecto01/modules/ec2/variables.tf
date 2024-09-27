variable "instance_type_ec2" {
  description = "Especificaciones de la VM - Tier"
  type        = string
}

variable "instance_ami_ec2" {
  description = "Especificaciones de la VM - AMI"
  type        = string
}

variable "instance_subnet_id" {
  description = "Especificaciones de la VM - Subnet"
  type        = string
}

variable "instance_sg_module" {
  description = "Especificaciones de la VM - ID sg"
  type        = string
}

variable "instances_pool" {
  description = "Lista de instancias a crear"
  type        = list(string)
}