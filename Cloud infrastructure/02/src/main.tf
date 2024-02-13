resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_web" {
  folder_id      = var.folder_id
  name           = local.vpc_web_name
  zone           = var.vms_resources.web.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vms_resources.web.cidr
  route_table_id = yandex_vpc_route_table.develop_routes.id
}

resource "yandex_vpc_subnet" "develop_db" {
  folder_id      = var.folder_id
  name           = local.vpc_db_name
  zone           = var.vms_resources.db.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vms_resources.db.cidr
  route_table_id = yandex_vpc_route_table.develop_routes.id
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_name
}

resource "yandex_vpc_gateway" "develop_gateway" {
  folder_id      = var.folder_id
  name           = local.gateway_name
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "develop_routes" {
  folder_id  = var.folder_id
  name       = local.routes_name
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.develop_gateway.id
  }
}