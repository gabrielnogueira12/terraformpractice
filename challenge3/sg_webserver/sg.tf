variable "egressandingress" {
    type = list(number)
}

variable "sg_name"{
    type = string
}

variable "cidrblocks"{
    type = string
}

variable "protocol_type"{
    type = string
}

resource "aws_security_group" "sg_webserver" {
    name = var.sg_name

    dynamic "ingress" {
        iterator = port
        for_each = var.egressandingress
        content {
        from_port = port.value
        to_port = port.value
        protocol = var.protocol_type
        cidr_blocks = [var.cidrblocks]
        }
    }


    dynamic "egress" {
        iterator = port
        for_each = var.egressandingress
        content {
        from_port = port.value
        to_port = port.value
        protocol = var.protocol_type
        cidr_blocks = [var.cidrblocks]
        }
    }
}

output "name" {
    value = aws_security_group.sg_webserver.name
}