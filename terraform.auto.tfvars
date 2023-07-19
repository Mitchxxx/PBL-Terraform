region = "eu-west-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"

ami-bastion = "ami-0fede084a0b3d899d"

ami-nginx = "ami-0de6ce505865a70bd"

ami-sonar = "ami-0e1e270df6ed65f14"

ami-web = "ami-05bb143cfc14e6782"

account_no = "748527796092"

keypair = "terraform-key"

master-username = "mitchdb"

master-password = "devopsdbl"

tags = {
  Owner-Email     = "megboko@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "748527796092"
}