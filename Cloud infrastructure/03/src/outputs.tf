output "vm_info_list" {
    value = { 
            for vm in concat([
                tolist(yandex_compute_instance.web),
                tolist(yandex_compute_instance.db),
                [yandex_compute_instance.storage]
            ])
        : vm => {
            name = vm.name,
            id   = vm.id,
            fqdn = vm.fqdn
        }
    }
    description = "All VMs info"
}