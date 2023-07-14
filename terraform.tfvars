region = "eu-west-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"

ami-web = "ami-0f0f1c02e5e4d9d9f"

account_no = "748527796092"

keypair = "terraform-key"

db-username = "mitchdb"

db-password = "devopsdbl"

tags = {
  Owner-Email     = "megboko@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "748527796092"
}