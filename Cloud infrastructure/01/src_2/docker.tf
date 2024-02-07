provider "docker" {
  host     = "ssh://user@remote-host:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
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

  environment = {
    "MYSQL_ROOT_PASSWORD" = "example_${random_password.random_string.result}"
    "MYSQL_DATABASE"      = "wordpress"
    "MYSQL_USER"          = "wordpress"
    "MYSQL_PASSWORD"      = "example_${random_password.random_string.result}"
    "MYSQL_ROOT_HOST"     = "%"
  }
}