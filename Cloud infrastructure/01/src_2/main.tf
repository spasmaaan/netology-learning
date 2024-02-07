terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=0.13" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host     = "ssh://user@remote-host:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}
#однострочный комментарий

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"

  ports {
    internal = 3306
  }

  env {
    MYSQL_ROOT_PASSWORD = "example_${random_password.random_string.result}"
    MYSQL_DATABASE      = wordpress
    MYSQL_USER          = wordpress
    MYSQL_PASSWORD      = "example_${random_password.random_string.result}"
    MYSQL_ROOT_HOST     = "%"
  }
}