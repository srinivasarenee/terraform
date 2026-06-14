variable "instances" {
  type        = map(any)
  description = "Instances"
  default = {
    "frontend" : "t3.micro"
    "user" : "t3.micro",
  "cart" : "t3.micro" }
}

variable "usernames" {
  type    = list(string)
  default = ["alice", "bob", "charlie"]
}

variable "environments" {
  type = map(string)
  default = {
    dev  = "t3.micro"
    prod = "m5.large"
  }
}
variable "ingress_rules" {
default = [
  {
            port = 22
            cidr_blocks = ["0.0.0.0/0"]
            description = "allowing port number 22 from internet"
  },
  {
    port = 443
    cidr_blocks = ["0.0.0.0/0"]
    description = "allowing port number 443 from internet"
  }
]

}