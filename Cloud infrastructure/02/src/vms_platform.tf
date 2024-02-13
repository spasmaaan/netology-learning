resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_name
  platform_id = vms_resources.web.platform_id
  zone        = vms_resources.web.zone
  metadata = local.vm_metadata
  resources {
    cores         = vms_resources.web.cores
    memory        = vms_resources.web.memory
    core_fraction = vms_resources.web.core_fraction
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
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = true
  }
}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = vms_resources.db.platform_id
  zone        = vms_resources.db.zone
  metadata = local.vm_metadata
  resources {
    cores         = vms_resources.db.cores
    memory        = vms_resources.db.memory
    core_fraction = vms_resources.db.core_fraction
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
    subnet_id = yandex_vpc_subnet.develop_db.id
  }
}