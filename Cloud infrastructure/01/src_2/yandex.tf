provider "yandex" {
  token     = yandex-auth-secrets.token
  folder_id = yandex-auth-secrets.folder_id
  zone = "ru-central1-a"
}

resource "yandex_message_queue" "fifo-queue" {
  name                        = "mq-terraform.fifo"
  visibility_timeout_seconds  = 600
  receive_wait_time_seconds   = 20
  message_retention_seconds   = 1209600
  fifo_queue                  = true
  access_key                  = yandex-auth-secrets.access_key
  secret_key                  = yandex-auth-secrets.secret_key
}