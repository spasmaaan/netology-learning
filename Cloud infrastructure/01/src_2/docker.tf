provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"

  ports {
    internal = 22
    external = 3306
    ip = "127.0.0.1"
  }
  # Не удалось разобраться, как подключиться по ssh к контейнеру.connection {
  # 127.0.0.1:3306 доступен, но ssh -p 3306 127.0.0.1 не заходит. 

  env = [
    "MYSQL_ROOT_PASSWORD=example_${random_password.random_string.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=example_${random_password.random_string.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}
