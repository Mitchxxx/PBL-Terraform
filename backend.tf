terraform {
  backend "s3" {
    bucket         = "mitchxx-test-001"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}