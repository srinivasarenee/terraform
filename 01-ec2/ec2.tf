resource "aws_instance" "webserver" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_vpc_tls.id]

  tags = {
    Name    = "webserver"
    Project = "vpcpoc"

  }
}

resource "aws_security_group" "allow_vpc_tls" {
  name        = "allow_vpc_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  //vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_vpc_tls"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_vpc_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_vpc_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
