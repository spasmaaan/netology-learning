locals {
    vm_use_nat = true
    vm_metadata = {
        serial-port-enable = true
        ssh-keys           = "ubuntu:${file(var.vms_ssh_root_keyfile)}"
    }
    vpc_security_group_name = "${var.vpc_name}-security-group"
}