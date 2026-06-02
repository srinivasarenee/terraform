variable "environment" {
  type        = string
  description = "Instance Id"
  default     = "dev"
}
variable "ami_id" {
  type        = string
  description = "Instance Id"
  default     = "ami-0220d79f3f480ecf5"
}
variable "instance_type_micro" {
  type        = string
  description = "Instance Id"
  default     = "t3.micro"
}
variable "instance_type_small" {
  type        = string
  description = "Instance Id"
  default     = "t3.small"
}
variable "ec2_tags" {
  type        = map(string)
  description = "ec2 tags"
  default = {
    Name    = "webserver"
    Project = "vpcpoc"

  }
}
variable "security_group_name" {
  type        = string
  description = "security group name"
  default     = "allow_vpc_tls"
}
variable "security_group_desc" {
  type        = string
  description = "security group desc"
  default     = "Allow TLS inbound traffic and all outbound traffic"
}
variable "security_group_tags" {
  type        = map(string)
  description = "security group  tags"
  default = {
    Name    = "allow_vpc_tls",
    Project = "devpoc"
  }
}

variable "from_port" {
  type        = number
  description = "from port"
  default     = 0
}
variable "to_port" {
  type        = number
  description = "to port"
  default     = 0
}
variable "protocol" {
  type        = string
  description = "protocol"
  default     = "-1"
}
variable "ipv4_cidr_block" {
  type        = list(string)
  description = "cidr block"
  default     = ["0.0.0.0/0"]
}
variable "ipv6_cidr_block" {
  type        = list(string)
  description = "cidr block"
  default     = ["::/0"]
}