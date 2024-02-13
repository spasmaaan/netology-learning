locals {
    vpc_web_name = "${var.vpc_name}-web"
    vpc_db_name = "${var.vpc_name}-db"

    vm_web_name = "netology-${var.vpc_name}-platform-web"
    vm_db_name = "netology-${var.vpc_name}-platform-db"

    vm_metadata = {
        serial-port-enable = true
        ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    }

    default = {
        zone = var.vms_resources.web.zone
    }
}