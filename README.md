# Scalable Web App Blueprint (AWS + Terraform)

Infrastructure Design done by me :)

![image](https://user-images.githubusercontent.com/8051411/236645568-476b326f-15df-4a57-bdb5-a293b50b559c.png)

Feel free to modify and adapt it to your needs, this is a purely practice project but it can be refined, enhanced and used in a production environment if needed.

**Note**: The full infra hasn't been done yet, it is still a work in progress. 

### Dependencies

- Terraform version ~> 1.4.2
- AWS Account
- AWS CLI any supported version.

### Deploying

Once you've cloned this repo into your local computer, you will need to:

- Configure your AWS credentials, run `aws configure`.
- Make sure that the configured region is the desired.
- Run `terraform init` to initialize modules.
- Run `terraform plan` to double-check if needed, also remember to check your configured region. (The default region on this repo is `eu-west-1`)
- Run `terraform apply` and enjoy!

### Thank you!
