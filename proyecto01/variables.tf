variable "main_tags" {
  description = "Lista de tags predefinidas"
  type        = map(string)
}

variable "specs_ec2" {
  description = "Lista de specs"
  type        = map(string)
}

variable "cidr_block" {
  description = "Lista de CIDRs"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ingress_ports_list" {
  description = "Lista de puertos de ingress"
  type        = list(number)
}