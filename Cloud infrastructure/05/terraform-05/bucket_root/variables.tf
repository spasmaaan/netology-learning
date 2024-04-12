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

variable "task_4_1" {
  type        = string 
  description = "IP адрес"
  validation {
    condition = can(cidrhost("${var.task_4_1}/32", "0"))
    error_message = "Переменная содержит неправильный IP адрес."
  }
}

variable "task_4_2" {
  type        = set(string) 
  description = "Список IP адресов"
  validation {
    condition = can(alltrue([
      for ip in var.task_4_2 : cidrhost("${ip}/32", "0")
    ]))
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
        condition = can(tobool(var.in_the_end_there_can_be_only_one.Duncan) != tobool(var.in_the_end_there_can_be_only_one.Duncan))
    }
}