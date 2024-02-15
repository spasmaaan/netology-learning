resource "yandex_compute_instance" "db" {
  for_each = {
    0 = "main", 
    1 = "replica"
  }
  name        = each.value
  platform_id = var.each_vm[each.key].platform_id
  zone        = var.default_zone
  metadata    = local.vm_metadata

  resources {
    cores         = var.each_vm[each.key].cores
    memory        = var.each_vm[each.key].memory
    core_fraction = var.each_vm[each.key].core_fraction
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
    security_group_ids = var.each_vm[each.key].security_group_ids
  }
}