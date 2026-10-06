variable "shortname" {
  type        = string
  description = "Short name for the resources. Part of the naming convention."
}

variable "project" {
  type        = string
  description = "Project name for the resources. Part of the naming convention."
}

variable "environment" {
  type        = string
  description = "Environment for the resources. Part of the naming convention. Must be one of dev, test or prod."

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be dev, test or prod."
  }
}

variable "location" {
  type        = string
  description = "Location for the resources. Part of the naming convention."
}

variable "app_subnet_key" {
  type        = string
  default     = "app"
  description = "Key for the application subnet in the subnets map. Part of the naming convention."
}

variable "state_backend" {
  type        = map(string)
  description = "Map of state backend configuration values. Must include the following keys: storage_account_name, container_name, key, and resource_group_name."
}
