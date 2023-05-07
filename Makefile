tf-graph:
	terraform graph | dot -Tpng > plan.png

tf-plan-dev:
	terraform plan -var-file="dev.tfvars"

tf-plan-test:
	terraform plan -var-file="test.tfvars"

tf-plan-prod:
	terraform plan -var-file="prod.tfvars"

tf-apply-dev:
	terraform apply -var-file="dev.tfvars"

tf-apply-test:
	terraform apply -var-file="test.tfvars"

tf-apply-prod:
	terraform apply -var-file="prod.tfvars"

tf-destroy:
	terraform destroy -var-file="dev.tfvars"
