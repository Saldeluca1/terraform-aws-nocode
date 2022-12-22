variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}

variable "aws_region"{
  description = "The region Terraform deploys your instance"
}

variable "owner" {
  default = "dpeacock"
  description = "person from HC that deployed the resource"
}

variable "TicketNumber" {
  description = "Input a valid ticket number"
}

variable "Department" {
  description = "the department the resource is for"
    }

variable "Billable" {
  description = "to bill or not to bill"
  }

variable "vault_address" {
    description = "url to use to access vault"
    default = "https://dp-vault-cluster.vault.1e53275e-94b7-4575-b679-735c6df54970.aws.hashicorp.cloud:8200/ui/vault"

  }

variable "vault_namespace" {
    description = "namespace to use"
    default = "/admin"
}

variable "login_username" {
    description = "vault auth username"
}

variable "login_password" {
    description = "vault auth password"
}