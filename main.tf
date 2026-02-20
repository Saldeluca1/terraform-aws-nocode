terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.11.0"
    }
  }
}
provider "aws" {
  region = var.aws_region

}

# Example: Fetching the latest approved Ubuntu 24.04 AMI
data "aws_ami" "hc-base-ubuntu-2404" {
  for_each = toset(["amd64", "arm64"])
  filter {
    name   = "name"
    values = [format("hc-base-ubuntu-2404-%s-*", each.value)]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
  most_recent = true
  owners      = ["888995627335"] # ami-prod account
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  count         = 1
  tags = {
    Department = var.Department
    Billable = var.Billable
    TicketNumber = var.TicketNumber
  }

  lifecycle {

    # The EC2 instance must be allocated a public DNS hostname.
    postcondition {
      condition     = self.public_dns != ""
      error_message = "EC2 instance must be in a VPC that has public DNS hostnames enabled."
    }
    
    # The EC2 instance must have a specific tag.
    postcondition {
      condition     = self.tags["Billable"] == "true"
      error_message = "tags[\"Billable\"] must be \"true\"."
    }
  }
}
