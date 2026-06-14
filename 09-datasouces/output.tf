output "ami_id" {
  value = data.aws_ami.devops.id
}

output "terraform_app" {

  value = data.aws_instance.terraform_ins
}