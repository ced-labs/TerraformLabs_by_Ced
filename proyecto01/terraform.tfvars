#This tags will be added to all resources.
#Set your desired tags
main_tags = {
  "Author"         = "Author name"
  "Env"            = "Environment"
  "Cloud_Provider" = "Cloud Provider Name"
  "Region"         = "Cloud Provider Region"
}

#Set your desired specs for the LB pool
specs_ec2 = {
  "ami"           = "ami-0062b622072515714"
  "instance_type" = "t2.micro"
}

#Set your desired IP address for VPC and public/private subnet
cidr_block = {
  "cidr_vnet"           = "10.10.0.0/16"
  "cidr_public_subnet"  = "10.10.0.0/24"
  "cidr_private_subnet" = "10.10.1.0/24"
}

#Remember: Set correctly this IP, now is open to all.
sg_ingress_cidr = "0.0.0.0/0"

ingress_ports_list = [22, 80, 443]
