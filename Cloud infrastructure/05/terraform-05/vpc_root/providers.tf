terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
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

  backend "s3" {
    endpoint  = "storage.yandexcloud.net"
    bucket    = "leo-jek-test-bucket"
    region    = "ru-central1"
    key       = "terraform-05/vm_root/terraform.tfstate"
    
    skip_region_validation      = true
    skip_credentials_validation = true

    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g4miehos1tgo03ri7l/etn1q56i77qgqcr9jqg8"
    dynamodb_table = "tfstate-develop"
  }
}

provider "yandex" {
  service_account_key_file  = file(var.yc_keyfile)
  cloud_id                  = var.cloud_id
  folder_id                 = var.folder_id 
  zone                      = data.terraform_remote_state.vpc.outputs.zone
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
  # checkov:skip=CKV_SECRET_6: education
  token           = "education"
}
