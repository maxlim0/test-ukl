variable "project_name" {
  type    = string
  default = "k8s-test-291010"
}

variable "gcp_region_eu-west4" {
  type    = string
  default = "europe-west4"
}

variable "gcp_zone_eu-west4-a" {
  type    = string
  default = "europe-west4-a"
}

variable "vpc_name" {
  type    = string
  default = "ukl-vpc-test"
}

variable "subnet_name" {
  type    = string
  default = "ukl-subnet-01"
}

variable "network_name" {
  type    = string
  default = "ukl-vpc-test"
}

variable "SA_TERRAFORM_K8S_TEST_291010" {
  type    = string
}


