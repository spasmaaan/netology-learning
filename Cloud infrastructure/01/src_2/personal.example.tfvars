variable "yandex_cloud_id" {
  type    = string
  default = "abcdefghijklmnopqrst"
}

resource "yandex_folder_id" {
  type    = string
  default = "abcdefghijklmnopqrst"
}

resource "yandex_account_key_file" {
  type    = string
  default = "~/key.json"
}
