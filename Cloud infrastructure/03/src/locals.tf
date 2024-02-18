locals {
    vm_use_nat = true
    vm_metadata = {
        serial-port-enable = true
        ssh-keys           = "ubuntu:${file(var.vms_ssh_root_keyfile)}"
    }
    vpc_security_group_name     = "${var.vpc_name}-security-group"
    ansible_hosts_cfg_filename  = "hosts.cfg"
    ansible_playbook_filename   = "test.yml"

    vpc = {
        network_id = "enp7i560tb28nageq0cc"
        subnet_ids = [
            "e9b0le401619ngf4h68n",
            "e2lbar6u8b2ftd7f5hia",
            "b0ca48coorjjq93u36pl",
            "fl8ner8rjsio6rcpcf0h",
        ]
        subnet_zones = [
            "ru-central1-a",
            "ru-central1-b",
            "ru-central1-c",
            "ru-central1-d",
        ]
    }
}