/* output "ec2_output" {
  description = "The EC2 Instance Creation Output"
  value       = aws_instance.terraform_app_server

} */

output "listFruits" {
  value = var.listFruits

}

output "setFruits" {
  value = var.setFruits

}