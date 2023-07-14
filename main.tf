#################################
##Creating bucket for s3 backend
#################################

resource "aws_s3_bucket" "terraform_state" {
  bucket = "mitchxx-test-001"
  # Enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }
  force_destroy = true
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}


# Module for Virtual Private Cloud, this will create a Virtual Private Cloud
module "VPC" {
  source                              = "./modules/VPC"
  region                              = var.region
  vpc_cidr                            = var.cidr_block
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

# Module for Application Load Balancer, this will create an External Load balancer and Internal Balancer
module "ALB" {
  source             = "./modules/ALB"
  vpc_id             = module.VPC.vpc_id
  public-sg          = module.Security.ALB-sg
  private-sg         = module.Security.IALB-sg
  public-sbn-1       = module.VPC.public_subnets-1
  public-sbn-2       = module.VPC.public_subnets-2
  private-sbn-1      = module.VPC.private_subnets-1
  private-sbn-2      = module.VPC.private_subnets-2
  load_balancer_type = "application"
  ip_address_type    = "ipV4"

}

# Module for Security Groups, this will create Security Groups for Each layer of the infrastructure

module "security" {
  source = "./modules/Security"
  vpc_id = module.VPC.vpc_id
}

# Module for Autoscaling Groups, this will AutoScaling group instances
module "AutoScaling" {
  source            = "./modules/Autoscaling"
  ami-web           = var.ami
  ami-bastion       = var.ami
  ami-nginx         = var.ami
  desired_capacity  = 2
  min_size          = 2
  max_size          = 2
  web-sg            = [module.security.web-sg]
  bastion-sg        = [module.security.bastion-sg]
  nginx-sg          = [module.security.nginx-sg]
  wordpress-alb-tgt = module.ALB.wordpress-tgt
  nginx-alb-tgt     = module.ALB.nginx-tgt
  tooling-alb-tgt   = module.ALB.tooling-tgt
  instance_profile  = module.VPC.instance_profile
  public_subnets    = [module.VPC.public_subnets-1, module.VPC.public_subnets-2]
  private_subnets   = [module.VPC.private_subnets-1, module.VPC.private_subnets-2]
  keypair           = var.keypair

}