output "vms_web_info" {
    value = {
        instance_name = yandex_compute_instance.platform_web.name,
        external_ip = yandex_compute_instance.platform_web.network_interface.nat_ip_address, 
        fqdn = yandex_compute_instance.platform_web.fqdn
    }
    description = "Web platform info"
}