variable "cidr_vnet" {
  description = "CIDR de la VPC"
  type        = string
}

variable "cidr_public_subnet" {
  description = "CIDR de la Public Subnet"
  type        = string
}

variable "cidr_private_subnet" {
  description = "CIDR de la Private Subnet"
  type        = string
}


variable "sg_ingress_cidr_module" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ingress_ports_list_module" {
  description = "Lista de puertos de ingress"
  type        = list(number)

}

variable "instance_pool_id" {
  description = "Instances Pools ID"
  type        = list(string)
}
