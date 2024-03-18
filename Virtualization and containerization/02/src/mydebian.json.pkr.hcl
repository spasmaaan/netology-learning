source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "b1gs9dh78rcvcejqjudg"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "e9bq2k2co5qhdjfsu2i2"
  token               = ""
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt install -y docker",
      "sudo apt install -y htop tmux"
    ]
  }
}