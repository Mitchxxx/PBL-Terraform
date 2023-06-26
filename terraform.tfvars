region = "eu-west-1"

vpc_cidr = "172.16.0.0/16" 

enable_dns_support = "true" 

enable_dns_hostnames = "true"  

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"

tags = {
    Owner-Email = "megboko@gmail.com"
    Managed-By = "Terraform"
    Billing-Account = "748527796092"
}