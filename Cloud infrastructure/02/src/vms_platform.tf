resource "yandex_compute_instance" "platform-web" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone

  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
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
    nat       = true
  }

  metadata = {
    serial-port-enable = true
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

resource "yandex_compute_instance" "platform-db" {
  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.db_zone

  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
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
    subnet_id = yandex_vpc_subnet_db.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = true
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}