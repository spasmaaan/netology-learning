output "vpc_dev_list" {
    value = {
        network = module.vpc_dev.network,
        subnets  = module.vpc_dev.subnets
    }
    description = "Dev VMs info"
}
