###cloud vars
variable "yc_keyfile" {
  type        = string
  default     = "~/.authorized_key.json"
  description = "YC service account key file"
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

variable "task_4_1" {
  type        = string 
  description = "IP адрес"
  validation {
    condition = cidrhost(var.task_4_1)
    error_message = "Переменная содержит неправильный IP адрес."
  }
}

variable "task_4_2" {
  type        = set(string) 
  description = "Список IP адресов"
  validation {
    condition = alltrue([
      for ip in var.task_4_2 : cidrhost(ip)
    ])
    error_message = "Список содержит хотя бы один неправильный IP адрес."
  }
}

variable "task_5_1" {
  type        = string 
  description = "любая строка"
  validation {
    condition = can(regex("^[a-z ]+$", var.task_5_1))
    error_message = "Строка содержит символы верхнего регистра или недопустимые символы."
  }
}

variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = true
        Connor = false
    }

    validation {
        error_message = "There can be only one MacLeod"
        condition = tobool(var.in_the_end_there_can_be_only_one.Duncan) != tobool(var.in_the_end_there_can_be_only_one.Duncan)
    }
}