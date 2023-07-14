variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of private subnets"
}

variable "name" {
  type    = string
  default = "ACS"

}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "environment" {
  type        = string
  description = "Enviroment"
}

variable "ami" {
  type        = string
  description = "Instance AMI ID for Lauch Templates"
}

variable "keypair" {
  type        = string
  description = "Key pir for the Instances"
}

variable "account_no" {
  type        = number
  description = "The AWS account number"
}

variable "db-username" {
  type        = string
  description = "RDS Username"
}

variable "db-password" {
  type        = string
  description = "RDS password"
}