variable "instances" {
  type = map 
  default = {
    mongodb = "t3.micro"
    mysql   = "t3.small"

  }

}
