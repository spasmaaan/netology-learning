resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_web" {
  name           = var.vpc_name
  zone           = var.web_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.web_cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}-db"
  zone           = var.db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.db_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_name
}
