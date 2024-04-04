variable "name" {
    type        = string
    description = "Net name"
}

variable "subnets" {
    type = list(object({
        zone    = string
        cidr    = string
    }))
    description = "List of location zones and v3 cidr blocks"
}
