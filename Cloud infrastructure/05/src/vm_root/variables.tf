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


###example vm_web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

###example vm_db var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
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
    image_family       = string,
    public_ip          = bool,
    serial_port_enable = number
  }))
  default = {
    analitycs = {
        name                = "analytics",
        count               = 1,
        env                 = "stage",
        image_family        = "ubuntu-2004-lts",
        public_ip           = true,
        serial_port_enable  = 1
    },
    marketing = {
        name                = "marketing",
        count               = 1,
        env                 = "stage",
        image_family        = "ubuntu-2004-lts",
        public_ip           = true,
        serial_port_enable  = 1
    }
  }
}

variable "s3_bucket_name" {
  type        = string
  default     = "s3-test"
  description = "S3 bucket name."
}