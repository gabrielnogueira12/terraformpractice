variable "script_data"{
    type = string
}

variable "webserver_name"{
    type = string
}

variable "security_group_name"{
    type = string
}

data "template_file" "userdata" {
    template = file(var.script_data)
}

resource "aws_instance" "webserver" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"
    security_groups = [var.security_group_name]

    tags = {
      Name = var.webserver_name
    }

    user_data = data.template_file.userdata.rendered
}

resource "aws_eip" "elasticIP" {
    instance = aws_instance.webserver.id
}