# MODULARISING CHALLENGE 2

provider "aws" {
    region = "sa-east-1"
}

module "dbserver_module" {
    source = "./dbserver"
    dbserver_name = "DB Server"
}

output "dbserver_privateip" {
    value = module.dbserver_module.privateIP
}

module "sg_webserver_module" {
    source = "./sg_webserver"
    egressandingress = [80, 443]
    sg_name = "SG01-webserver"
    cidrblocks = "0.0.0.0/0"
    protocol_type = "tcp"
}

output "sg_webserver_name_output" {
    value = module.sg_webserver_module.name
}

module "webserver_module" {
    source = "./webserver"
    script_data = "server-script.sh"
    webserver_name = "Web Server"
    security_group_name = module.sg_webserver_module.name
}
