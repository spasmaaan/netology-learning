resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_web" {
  name           = local.vpc_web_name
  zone           = var.vms_resources.web.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vms_resources.web.cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = local.vpc_db_name
  zone           = var.vms_resources.db.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vms_resources.db.cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_name
}
