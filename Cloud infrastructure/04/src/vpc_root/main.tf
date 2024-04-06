module "vpc_prod" {
  source       = "./vpc"
  name         = "production"
  subnets      = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
  ]
}

module "vpc_dev" {
  source       = "./vpc"
  name         = "develop"
  subnets      = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}
