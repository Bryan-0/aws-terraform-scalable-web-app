# Scalable Web App Blueprint (AWS + Terraform)

Infrastructure Design

![image](https://user-images.githubusercontent.com/8051411/236645568-476b326f-15df-4a57-bdb5-a293b50b559c.png)

Feel free to modify and adapt it to your needs, this is a purely practice project but it can be refined, enhanced and used in a production environment if needed.

**Note: The private subnet part hasn't been done yet, everything else is functional!**

### Dependencies

- Terraform version ~> 1.4.2
- AWS Account
- AWS CLI any supported version.

### Deploying

Once you've cloned this repo into your local computer, you will need to:

- Configure your AWS credentials, run `aws configure`.
- Configure your environment variables with the following:
(create a tfvars file e.g. `dev.tfvars`)
```
infra_region = "eu-west-1"
web_domain = "example.com"
environment = "dev"
```
- Run `terraform init` to initialize modules.
- Run `terraform plan -var-file="dev.tfvars"` or simply `make tf-plan-dev` to double-check if needed, also remember to check your configured region.
- Run `terraform apply -var-file="dev.tfvars"` or simply `make tf-apply-dev` and enjoy!

Hosted web app:

![image](https://github.com/Bryan-0/aws-terraform-scalable-web-app/assets/8051411/b7de75b9-50c8-46f8-8a77-f8c1f1897009)


### Thank you!
