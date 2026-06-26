module "ec2" {
  source        = "../terraform-aws-instance"
  ami_id        = var.ami_id
  instance-type = var.instance-type

}