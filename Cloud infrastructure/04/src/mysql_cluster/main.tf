resource "yandex_mdb_mysql_cluster" "cluster" {
  name        = var.name
  environment = var.environment
  network_id  = var.network_id
  version     = "8.0"

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
    }
  }
}