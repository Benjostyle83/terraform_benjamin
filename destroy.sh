cd $REPO_ROOT
cd terraform/resources/dev/bastion-host
terraform destroy -auto-approve

cd $REPO_ROOT
cd terraform/resources/dev/vpc
terraform destroy -auto-approve