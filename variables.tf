variable "enable_dns_hostnames" {
  default = "true"
}

variable "enable_dns_support" {
  default = "true"
}

variable "cidr_prefix" {
  default = "172"
}

variable "subnet_count" {
  default = 2
}

variable "subnet_cidr_blocks" {
  type = "map"

  default = {
    availabilityzone_a = "172.0.1.0/24"
    availabilityzone_b = "172.0.2.0/24"
  }
}

variable "tag_project_identifier" {}

variable "tag_budget" {}

variable "aws_region" {
  default = "eu-west-1"
}
