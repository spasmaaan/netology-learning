output "dev" {
    value = module.vpc_dev
    description = "VPC Dev"
}

output "prod" {
    value = module.vpc_dev
    description = "VPC Prod"
}

output "zone" {
    value = var.default_zone
    description = "Default zone"
}

