variable "cluster_id" {
    type        = string
    description = "MySQL cluster Id."
}

variable "database" {
    type        = string
    description = "Database name."
}

variable "user" {
    type        = string
    description = "User name."
}

variable "password" {
    type        = string
    sensitive   = true
    description = "Password for the user."
}