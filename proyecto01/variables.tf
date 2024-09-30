variable "main_tags" {
  description = "Main tag list by default"
  type        = map(string)
}

variable "specs_ec2" {
  description = "Specs VMs"
  type        = map(string)
}

variable "cidr_block" {
  description = "CIDR list"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ingress_ports_list" {
  description = "Ingress port list"
  type        = list(number)
}
