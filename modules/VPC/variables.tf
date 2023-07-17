variable "region" {
  
}

variable "vpc_cidr" {
  
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of private subnets"
}

variable "private_subnets" {
  type        = list(any)
  description = "LIst of private subnets"
}

variable "public_subnets" {
  type        = list(any)
  description = "List of public subnets"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  type    = string
  default = "ACS"
}

variable "environment" {
  type        = string
  description = "Environment"
  default = true
}

# variable "public_cidr_block" {
#   type        = string
#   default = "0.0.0.0/0"
# }