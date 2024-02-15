locals {
    vm_use_nat = true
    vm_metadata = {
        serial-port-enable = true
        ssh-keys           = "ubuntu:${file(var.vms_ssh_root_keyfile)}"
    }
}