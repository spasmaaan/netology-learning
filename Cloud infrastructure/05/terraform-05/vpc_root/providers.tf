terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.3.0"

  backend "s3" {
    endpoint  = "storage.yandexcloud.net"
    bucket    = "leo-jek-test-bucket"
    region    = "ru-central1"
    key       = "terraform-05/vm_root/terraform.tfstate"
    
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_credentials_validation = true
    force_path_style            = true

    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g4miehos1tgo03ri7l/etn1q56i77qgqcr9jqg8"
    dynamodb_table = "tfstate-develop"
  }
}

provider "yandex" {
  service_account_key_file  = file(var.yc_keyfile)
  cloud_id                  = var.cloud_id
  folder_id                 = var.folder_id 
  zone                      = var.default_zone
  version                   = "> 0.1"
}
