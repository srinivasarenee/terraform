variable "ami_id" {
  type        = string
  description = "Instance Id"
  default     = "ami-0220d79f3f480ecf5"
}
variable "instance-type" {
  type        = string
  description = "instance type"
  default     = "t3.micro"

}
variable "tags" {
  description = "EC2 tags"
  type        = map(any)
  default = {

    Name        = "VariableDemo"
    Project     = "Roboshop"
    Terraform   = "true"
    Environment = "Dev"
  }
}

variable "sg_name" {
  description = "seucrity group name"
  default     = "allow-all-terraform"
  type        = string

}
variable "sg_description" {
  description = "seucrity group description"
  default     = "aAllow TLS inbound traffic and all outbound traffic"
  type        = string

}
variable "sg_from_port" {
  type        = number
  description = "security group from port number"
  default     = 0

}
variable "sg_to_port" {
  type        = number
  description = "security group from port number"
  default     = 0

}
variable "cidr_blocks" {
  type        = list(any)
  description = "cidr block"
  default     = ["0.0.0.0/0"]

}
variable "sg-tags" {
  type        = map(any)
  description = "security group tags"
  default = {

    Name        = "allow-all-terraform"
    Name        = "VariableDemo"
    Project     = "Roboshop"
    Terraform   = "true"
    Environment = "Dev"
  }

}