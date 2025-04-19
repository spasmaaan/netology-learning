resource "yandex_mdb_mysql_cluster" "cluster" {
  name               = var.name
  environment        = "PRESTABLE"
  network_id         = var.network_id
  version            = "8.0"
  security_group_ids = [var.security_group_id]

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-hdd"
    disk_size          = 16
  }

  dynamic "host" {
    for_each = var.HA ? var.hosts : slice(var.hosts, 0, 1)
    content {
      zone      = host.value.zone
      subnet_id = host.value.subnet_id
      public_ip = false
      security_group_ids = [var.security_group_id]
    }
  }
}