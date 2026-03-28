resource "aws_instance" "terraform_app_server" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance-type
  //instance_type          = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  //tags                   = var.tags
  tags = {

    //Name        = "VariableDemo"
    Name        = var.instances[count.index]
    Project     = "Roboshop"
    Terraform   = "true"
    Environment = "Dev"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description


  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.sg-tags
}