variable "dbserver_name"{
    type = string
}

resource "aws_instance" "dbserver" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"

    tags = {
      Name = var.dbserver_name
    }
}

output "privateIP" {
    value = aws_instance.dbserver.private_ip
}