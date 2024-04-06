terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    aws = {
      source  = "hashicorp/aws"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  service_account_key_file  = file(var.yc_keyfile)
  cloud_id                  = var.cloud_id
  folder_id                 = var.folder_id 
  zone                      = var.default_zone
}
