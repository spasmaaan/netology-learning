locals {
    gateway_name = "${var.vpc_name}-gateway"
    routes_name = "${var.vpc_name}-route-table"

    vpc_web_name = "${var.vpc_name}-web"
    vpc_db_name = "${var.vpc_name}-db"

    vm_web_name = "netology-${var.vpc_name}-platform-web"
    vm_db_name = "netology-${var.vpc_name}-platform-db"
    vm_use_nat = true

    vm_metadata = {
        serial-port-enable = true
        ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    }

    default = {
        zone = var.vms_resources.web.zone
    }
}