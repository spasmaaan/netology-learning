output "vm_info_list" {
    value = { 
        for key, vm in flatten(concat([
            tolist(yandex_compute_instance.web),
            values(yandex_compute_instance.db),
            [yandex_compute_instance.storage]
        ])): key => {
            name = vm.name,
            id   = vm.id,
            fqdn = vm.fqdn
        }
    }
    description = "All VMs info"
}
