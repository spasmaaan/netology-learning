output "vpc_dev_list" {
    value = {
        network = module.vpc_dev.network,
        subnet  = module.vpc_dev.subnet
    }
    description = "Dev VMs info"
}
