variable "HA" {
    type        = bool
    description = "If High-Availability(HA) false then single host."
}

variable "hosts_count" {
    type = number
    default = 2
    description = "Count hosts"
}

variable "name" {
    type = string
    description = "Cluster name"
}

variable "environment" {
    type = string
    description = "Environment name"
}

variable "network_id" {
    type = string
    description = "Network id"
}

variable "hosts" {
  description = "Hosts settings"
  type = list(object({
    zone         = string
    subnet_id    = string
  }))
}
