data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc_root/terraform.tfstate"
  }
} 

data "template_file" "cloudinit" {
  template = file(var.vm_cloud_init_file)

  vars = {
    ssh_public_key = file(var.vms_ssh_root_keyfile)
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vms_options.analitycs.env
  network_id     = data.terraform_remote_state.vpc.outputs.dev.value.network.id
  subnet_zones   = [data.terraform_remote_state.vpc.outputs.zone]
  subnet_ids     = [data.terraform_remote_state.vpc.outputs.dev.value.subnets[0].id]
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
  network_id     = data.terraform_remote_state.vpc.outputs.dev.value.network.id
  subnet_zones   = [data.terraform_remote_state.vpc.outputs.zone]
  subnet_ids     = [data.terraform_remote_state.vpc.outputs.dev.value.subnets[0].id]
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

/*
module "db_cluster" {
  source       = "./mysql_cluster"
  name         = "example"
  environment  = "develop"
  HA           = local.db_cluster_ha
  network_id   = local.db_cluster_ha ? data.terraform_remote_state.vpc.outputs.prod.network.id : data.terraform_remote_state.vpc.outputs.dev.value.network.id
  hosts        = local.db_cluster_ha ? [{ 
    subnet_id = data.terraform_remote_state.vpc.outputs.prod.subnets[0].id, 
    zone = data.terraform_remote_state.vpc.outputs.prod.subnets[0].zone
  }, { 
    subnet_id = data.terraform_remote_state.vpc.outputs.prod.subnets[1].id, 
    zone = data.terraform_remote_state.vpc.outputs.prod.subnets[1].zone
  }] : [{ 
    subnet_id = data.terraform_remote_state.vpc.outputs.prod.subnets[0].id, 
    zone = data.terraform_remote_state.vpc.outputs.prod.subnets[0].zone
  }]
}

module "db_cluster_data" {
  source       = "./mysql_data"
  cluster_id   = module.db_cluster.cluster.id
  database     = "test"
  user         = "app"
  password     = "secret_pass"  
}
*/

/*
module "s3" {
  source         = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=master"
  bucket_name    = var.s3_bucket_name
  // 1 Gb
  max_size       = 1073741824
}
*/

data "vault_generic_secret" "vault_example" {
  path = "secret/example"
}

resource "vault_mount" "secret2" {
  path        = "secret2"
  type        = "kv"
  options     = { version = "1" }
  description = "KV Version 1 secret engine mount"
}

resource "vault_kv_secret" "example" {
  path = "${vault_mount.secret2.path}/example"
  data_json = jsonencode({
    test2   = "congrats!2"
  })
}