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

variable "vm_db_names" {
    type = map(string)
    default = {
        0 = "main", 
        1 = "replica"
    }
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

variable "storage_vm" {
  type = object({
    platform_id        = string,
    cores              = number,
    memory             = number,
    core_fraction      = number,
    disk_volume        = number,
    auto_delete_disks  = bool
  })
  default = {
    platform_id        = "standard-v1",
    cores              = 2,
    memory             = 1,
    core_fraction      = 5,
    disk_volume        = 0,
    auto_delete_disks  = true
  }
}

variable "disk_secondary" {
  type = object({
    count      = number,
    namePrefix = string
    type       = string,
    size       = number
  })
  default = {
    count      = 3,
    namePrefix = "secondary-disk-",
    type       = "network-hdd",
    size       = 1
  }
  description = "Count of secondary disks"
}

variable "web_provision" {
  type          = bool
  default       = true
  description   = "ansible provision switch variable"
}

variable "vpc" {
    type = object({
        network_id      = string
        subnet_ids      = list(string)
        subnet_zones    = list(string)
    })
    default = {
        network_id = "enp7i560tb28nageq0cc"
        subnet_ids = [
            "e9b0le401619ngf4h68n",
            "e2lbar6u8b2ftd7f5hia",
            "b0ca48coorjjq93u36pl",
            "fl8ner8rjsio6rcpcf0h",
        ]
        subnet_zones = [
            "ru-central1-a",
            "ru-central1-b",
            "ru-central1-c",
            "ru-central1-d",
        ]
    }
    description = "Variable for task 7."
}