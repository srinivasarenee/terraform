resource "aws_instance" "terraform_app_server" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  provisioner "local-exec" {
    command    = "echo 'Instance ${self.id} was created with IP ${self.public_ip}' >> inventory.ini"
    on_failure = continue
  }
  provisioner "local-exec" {
    when       = destroy
    command    = "echo 'Destroy-time provisioner'"
    on_failure = continue
  }
  provisioner "local-exec" {

    command    = "echo 'Creation-time provisioner'"
    on_failure = continue
  }

  provisioner "local-exec" {
    when       = destroy
    command    = "echo  >> inventory.ini"
    on_failure = continue
  }

  # Connection block is mandatory for remote-exec
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [

      "sudo dnf install nginx -y ",
      "sudo systemctl start nginx"
    ]
  }
  provisioner "remote-exec" {
    inline = [


      "sudo systemctl stop nginx"
    ]
    when       = destroy
    on_failure = continue
  }
  tags = {
    Name = "Terraform"
    # Project = "${local.identifier}"
    Project = local.identifier
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-all-terraform"
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