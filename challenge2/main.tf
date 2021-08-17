provider "aws" {
    region = "sa-east-1"
}

# QUESTION 1: CREATE A DB SERVER AND OUTPUT THE PRIVATE IP

resource "aws_instance" "dbserver" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"

    tags = {
      Name = "DB Sever"
    }
}

output "privateIP" {
    value = aws_instance.dbserver.private_ip
}


# QUESTION 2: CREATE A WEBSERVER WITH A FIXED IP AND RUN THE SCRIPT
data "template_file" "userdata" {
    template = file("server-script.sh")
}

resource "aws_instance" "webserver" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sg_webserver.name]

    tags = {
      Name = "Web Server"
    }

    user_data = data.template_file.userdata.rendered
}

resource "aws_eip" "elasticIP" {
    instance = aws_instance.webserver.id
}

# QUESTION 3: CREATE A SECURITY GROUP FOR THE WEBSERVER OPENING PORTS 80 AND 443

variable "egressandingress" {
    type = list(number)
    default = [ 80, 443 ]
}

resource "aws_security_group" "sg_webserver" {
    name = "Allow HTTP and HTTPS"


    dynamic "ingress" {
        iterator = port
        for_each = var.egressandingress
        content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }


    dynamic "egress" {
        iterator = port
        for_each = var.egressandingress
        content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
  
}


