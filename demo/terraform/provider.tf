provider "aws" {
  profile = "default"
  region  = var.aws_region
}

variable "aws_region" {
  description = "AWS Region"
  default     = "eu-central-1"
}

variable "domain" {
  description = "Domain you own in AWS"
}

variable "gateway_domain" {
  description = "Domain for the API Gateway. Should be a subdoamin of domain"
}