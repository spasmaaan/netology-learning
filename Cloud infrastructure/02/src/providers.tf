terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
  # token                  = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.web_zone
  service_account_key_file = file(var.yc_keyfile)
}