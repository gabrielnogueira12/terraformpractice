provider "aws" {
  region = "sa-east-1"
}

variable "vpcname1" {
    type = string
    default = "TerraformVPC"
}

resource "aws_vpc" "TerraformVPC" {
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = var.vpcname1
    }
}