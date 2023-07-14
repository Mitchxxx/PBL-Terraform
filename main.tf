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
    source                              = "./modules/ALB"
    vpc_id                              = module.VPC.vpc_id
    public-sg                           = module.Security.ALB-sg
    private-sg                          = module.Security.IALB-sg
    public-sbn-1                        = module.VPC.public_subnets-1
    public-sbn-2                        = module.VPC.public_subnets-2
    private-sbn-1                       = module.VPC.private_subnets-1
    private-sbn-2                       = module.VPC.private_subnets-2
    load_balancer_type                  = "application"
    ip_address_type                     = "ipV4"

}