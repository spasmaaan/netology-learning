output "vpc_dev_list" {
    value = module.vpc_dev.vpc_info
    description = "Dev VMs info"
}
