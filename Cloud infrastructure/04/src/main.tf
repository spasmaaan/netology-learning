data "template_file" "cloudinit" {
  template = file(var.vm_cloud_init_file)

  vars = {
    ssh_public_key = file(var.vms_ssh_root_keyfile)
  }
}

module "vpc_dev" {
  source       = "./vpc"
  name         = var.vpc_name
  zone         = var.default_zone
  cidr         = var.default_cidr
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vms_options.analitycs.env
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.vms_options.analitycs.name
  labels         = { 
    project: var.vms_options.analitycs.name 
  }
  instance_count = var.vms_options.analitycs.count
  image_family   = var.vms_options.analitycs.image_family
  public_ip      = var.vms_options.analitycs.public_ip

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.vms_options.analitycs.serial_port_enable
  }
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vms_options.marketing.env
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.vms_options.marketing.name
  labels         = { 
    project: var.vms_options.marketing.name 
  }
  instance_count = var.vms_options.marketing.count
  image_family   = var.vms_options.marketing.image_family
  public_ip      = var.vms_options.marketing.public_ip

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.vms_options.marketing.serial_port_enable
  }
}
