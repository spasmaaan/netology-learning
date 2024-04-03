output "vpc_info" {
    value = {
        net     = yandex_vpc_network.develop,
        subnet  = yandex_vpc_subnet.develop
    }
    description = "VPCs info"
}
