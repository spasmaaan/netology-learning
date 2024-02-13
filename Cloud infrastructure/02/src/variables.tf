###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "db_zone" {
  type        = string
  default     = "ru-central1-b"
}

variable "db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
}


variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}

variable "yc_keyfile" {
  type        = string
  default     = "~/.authorized_key.json"
  description = "YC service account key file"
}
variable "image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Ubuntu image name"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM web name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM web platform id"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "VM web cores count"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "VM web memory GBs count"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "VM web core fraction"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM db name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM db platform id"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "VM db cores count"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "VM db memory GBs count"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "VM db core fraction"
}