variable "name" {
  type        = string
  description = "Net name"
}

variable "zone" {
  type        = string
  description = "Location zone"
}

variable "cidr" {
  type        = list(string)
  description = "v4 cidr blocks list"
}
