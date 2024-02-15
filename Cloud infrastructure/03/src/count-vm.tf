resource "yandex_compute_instance" "web" {
  count       = var.vm_web_count
  name        = "web-${count.index + 1}"
  platform_id = var.count_vm.platform_id
  zone        = var.default_zone
  metadata    = local.vm_metadata

  resources {
    cores         = var.count_vm.cores
    memory        = var.count_vm.memory
    core_fraction = var.count_vm.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = local.vm_use_nat
    security_group_ids = var.count_vm.security_group_ids
  }
}