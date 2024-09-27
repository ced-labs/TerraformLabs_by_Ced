main_tags = {
  "Author"         = "Cristian Escribano"
  "Env"            = "PRO"
  "Cloud_Provider" = "AWS"
  "Region"         = "Paris"
}

specs_ec2 = {
  "ami"           = "ami-0062b622072515714"
  "instance_type" = "t2.micro"
}

cidr_block = {
  "cidr_vnet"           = "10.10.0.0/16"
  "cidr_public_subnet"  = "10.10.0.0/24"
  "cidr_private_subnet" = "10.10.1.0/24"
}

sg_ingress_cidr = "0.0.0.0/0"

ingress_ports_list = [22, 80, 443]