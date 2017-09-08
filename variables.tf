variable "enable_dns_hostnames" {
  default     = "true"
  description = "Indicates whether the instances launched in the VPC get public DNS hostnames"
}

variable "enable_dns_support" {
  default     = "true"
  description = "Indicates whether the DNS resolution is supported for the VPC"
}

variable "cidr_prefix" {
  default     = "172"
  description = "Network CIDR prefix - must be a private address space"
}

variable "tag_project_identifier" {}

variable "tag_budget" {}

variable "aws_region" {
  default     = "eu-west-1"
  description = "AWS region to deploy resources in"
}
