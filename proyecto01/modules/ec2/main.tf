# Creación de VM

resource "aws_instance" "ec2_pool" {
  count                  = length(var.instances_pool)
  ami                    = var.instance_ami_ec2
  instance_type          = var.instance_type_ec2
  user_data              = file("./modules/ec2/scripts/auto_apache.sh")
  subnet_id              = var.instance_subnet_id
  vpc_security_group_ids = [var.instance_sg_module]
  tags = {
    Name = var.instances_pool[count.index]
  }
}
