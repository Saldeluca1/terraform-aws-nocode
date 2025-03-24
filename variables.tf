variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}

variable "ec2-size" {
  description = "t2 size - micro or small"
  default     = "t2.micro"
}


variable "aws_region"{
  description = "The region Terraform deploys your instance"
  default   = "us-east-2"
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
