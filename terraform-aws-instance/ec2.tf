resource "aws_instance" "terraform_app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance-type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name    = "Terraform"
    Project = "DevOpsPractice-Module"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-all-terraform-module"
  description = "Allow TLS inbound traffic and all outbound traffic"


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow-all-terraform"
  }
}