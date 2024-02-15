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

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Ubuntu image name"
}

variable "vms_ssh_root_keyfile" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "ssh-keygen -t ed25519"
}

variable "vm_web_count" {
  type        = number
  default     = 2
  description = "Number of web VMs"
}

variable "count_vm" {
  type = object({
    platform_id        = string,
    cores              = number,
    memory             = number,
    core_fraction      = number,
    disk_volume        = number
  })
  default = {
    platform_id        = "standard-v1",
    cores              = 2,
    memory             = 1,
    core_fraction      = 5,
    disk_volume        = 0
  }
}

variable "each_vm" {
  type = list(object({
    platform_id        = string,
    cores              = number,
    memory             = number,
    core_fraction      = number,
    disk_volume        = number
  }))
  default = [
    {
      platform_id        = "standard-v1",
      cores              = 2,
      memory             = 2,
      core_fraction      = 20,
      disk_volume        = 0
    },
    {
      platform_id        = "standard-v1",
      cores              = 2,
      memory             = 1,
      core_fraction      = 5,
      disk_volume        = 0
    }
  ]
}