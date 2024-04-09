resource "yandex_vpc_network" "develop" {
  name = var.name
}
resource "yandex_vpc_subnet" "develop" {
  count          = length(var.subnets)
  name           = "${var.name}-${count.index + 1}"
  zone           = var.subnets[count.index].zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnets[count.index].cidr]
}
