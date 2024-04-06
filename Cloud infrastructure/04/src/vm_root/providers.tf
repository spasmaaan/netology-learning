terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    /*
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "> 3.5"
    }
    */
  }
  required_version = ">=1.3.0"
}

provider "yandex" {
  service_account_key_file  = file(var.yc_keyfile)
  cloud_id                  = var.cloud_id
  folder_id                 = var.folder_id 
  zone                      = var.default_zone
}

/*
provider "aws" {
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}
*/

provider "vault" {
  address         = "http://127.0.0.1:8200"
  skip_tls_verify = true
  token           = "education"
  # checkov:skip=CKV_SECRET_6: education
}
