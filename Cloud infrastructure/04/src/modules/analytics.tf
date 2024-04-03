
/*
module "analytics_vm" {
  source         = var.vms_source
  env_name       = var.vms_options.analitycs.env
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.vms_options.analitycs.name
  instance_count = var.vms_options.analitycs.count
  image_family   = var.vms_options.analitycs.image_family
  public_ip      = var.vms_options.analitycs.public_ip

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.vms_options.analitycs.serial_port_enable
  }
}
*/