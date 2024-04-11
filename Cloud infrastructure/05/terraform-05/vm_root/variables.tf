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

###common vars

variable "vms_ssh_root_keyfile" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
  description = "ssh-keygen -t ed25519"
}

variable "vm_cloud_init_file" {
  type        = string
  default     = "./cloud-init.yml"
  description = "Cloud init for VM"
}

variable "vms_options" {
  type = map(object({
    name               = string,
    count              = number,
    env                = string,
    image_family       = string
  }))
  default = {
    analitycs = {
        name                = "analytics",
        count               = 1,
        env                 = "stage",
        image_family        = "ubuntu-2004-lts"
    },
    marketing = {
        name                = "marketing",
        count               = 1,
        env                 = "stage",
        image_family        = "ubuntu-2004-lts"
    }
  }
}

variable "security_group_ingress" {
  description = "secrules ingress"
  type = list(object(
    {
      protocol       = string
      description    = string
      v4_cidr_blocks = list(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    {
      protocol       = "TCP"
      description    = "разрешить входящий ssh"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },
    {
      protocol       = "TCP"
      description    = "разрешить входящий  http"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },
    {
      protocol       = "TCP"
      description    = "разрешить входящий https"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    },
  ]
}

variable "security_group_egress" {
  description = "secrules egress"
  type = list(object(
    {
      protocol       = string
      description    = string
      v4_cidr_blocks = list(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    { 
      protocol       = "TCP"
      description    = "разрешить весь исходящий трафик"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 0
      to_port        = 65365
    }
  ]
}

variable "vpc_security_group_name" {
  type = string
  default = "vpc-security-group"
  description = "VPC security group name"
}
