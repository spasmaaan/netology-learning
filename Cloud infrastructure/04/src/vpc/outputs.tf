output "network" {
    value = yandex_vpc_network.develop
    description = "VPC network"
}

output "subnet" {
    value = yandex_vpc_subnet.develop
    description = "VPC subnet"
}

