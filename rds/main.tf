provider "aws" {
    region = "sa-east-1"
}

resource "aws_db_instance" "myRDS" {
    name = "myDB"
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.2.21"
    username = "gab"
    password = "fakepassword"
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true
}
