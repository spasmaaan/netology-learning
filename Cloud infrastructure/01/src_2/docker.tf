provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "mysql" {
  name = "mysql:8"
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello!'",
    ]

    connection {
      type        = "ssh"
      user        = "root"
      host        = self.network_data.0.ip_address
      timeout     = "2m"
    }
  }

  ports {
    internal = 3306
  }

  env = [
    "MYSQL_ROOT_PASSWORD=example_${random_password.random_string.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=example_${random_password.random_string.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}