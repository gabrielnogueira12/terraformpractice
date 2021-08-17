provider "aws" {
    region = "sa-east-1"
}

resource "aws_instance" "db" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"

    depends_on = [
      aws_instance.db
    ]
}
