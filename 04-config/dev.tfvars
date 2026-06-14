
security_group_name="security_group_dev"


# -var="environment=dev"
# -var-file

# export TF_VAR_environment="dev"
# terraform plan -var-file="$TF_VAR_environment.tfvars"

#unset TF_VAR_environment

## export ENV=dev

#terraform apply -var-file="${ENV}.tfvars"

#
#terraform plan -var-file="dev.tfvars"
#terraform apply -var-file="test.tfvars"
#terraform apply -var-file="prod.tfvars"

#$ export TF_VAR_environment="prod"

#SRINIVAS RAO@LAPTOP-RI1VM8GT MINGW64 /d/devops/repos/terraform/04-config (main)
#$ terraform plan -var-file="$TF_VAR_environment.tfvars"




