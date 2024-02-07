provider "yandex" {
  cloud_id  = yandex-auth-secrets.cloud_id
  folder_id = yandex-auth-secrets.folder_id
  service_account_key_file = file(yandex-auth-secrets.account_key_file)
  zone = "ru-central1-a"
}
