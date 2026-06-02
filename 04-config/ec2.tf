resource "aws_instance" "webserver" {
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? var.instance_type_micro : var.instance_type_small
  vpc_security_group_ids = [aws_security_group.allow_vpc_tls.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_vpc_tls" {
  name        = var.security_group_name
  description = var.security_group_desc
  //vpc_id      = aws_vpc.main.id

  tags = var.security_group_tags
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ipv4_cidr_block
    ipv6_cidr_blocks = var.ipv6_cidr_block
  }
  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ipv4_cidr_block
    ipv6_cidr_blocks = var.ipv6_cidr_block
  }
}

