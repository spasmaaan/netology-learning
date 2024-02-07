provider "yandex" {
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  service_account_key_file = file(var.yandex_account_key_file)
  zone = "ru-central1-a"
}
