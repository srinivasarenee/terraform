/* variable "instances" {
  type = map 
  default = {
    mongodb = "t3.micro"
    mysql   = "t3.small"

  }

} */

variable "instances" {
  type    = list(any)
  default = ["payment", "frontend"]

}

variable "ingress_rules" {

  default = [
    {
      port        = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port 22 from the inernet"

    },
    {
      port        = 443
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port 443 from the inernet"

    },
    {
      port        = 3306
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port 3306 from the inernet"

    }

  ]

}

