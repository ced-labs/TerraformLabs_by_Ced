#Modulo de ec2 para la creación del pool del instancias para el Load Balancer
module "ec2" {
  source             = "./modules/ec2"
  instance_ami_ec2   = var.specs_ec2.ami
  instance_type_ec2  = var.specs_ec2.instance_type
  instance_subnet_id = module.networking.output_subnet_id
  instance_sg_module = module.networking.output_sg
  instances_pool     = ["server01", "server02", "server03"]
}

#Modulo de networking para la creación de todos los recursos necesarios para el funcionamiento del Load Balancer
module "networking" {
  source                    = "./modules/networking"
  cidr_vnet                 = var.cidr_block.cidr_vnet
  cidr_public_subnet        = var.cidr_block.cidr_public_subnet
  cidr_private_subnet       = var.cidr_block.cidr_private_subnet
  sg_ingress_cidr_module    = var.sg_ingress_cidr
  ingress_ports_list_module = var.ingress_ports_list
  instance_pool_id          = module.ec2.ec2_pool_id
}
