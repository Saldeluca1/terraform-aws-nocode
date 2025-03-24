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

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
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
