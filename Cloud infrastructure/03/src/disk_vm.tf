resource "yandex_compute_disk" "storage_disk" {
  count = var.disk_secondary.count
  name = "${var.disk_secondary.namePrefix}${count.index + 1}"
  type = var.disk_secondary.type
  zone = var.default_zone
  size = var.disk_secondary.size
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = var.storage_vm.platform_id
  zone        = var.default_zone
  metadata    = local.vm_metadata

  resources {
    cores         = var.storage_vm.cores
    memory        = var.storage_vm.memory
    core_fraction = var.storage_vm.core_fraction
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
    security_group_ids = [yandex_vpc_security_group.develop.id]
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk.*.id
    content {
      disk_id     = secondary_disk.value
      auto_delete = var.storage_vm.auto_delete_disks
    }
  }
}