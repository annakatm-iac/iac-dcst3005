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
  description = "Environment for the resources. Part of the naming convention."

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be dev, test or prod."
  }
}

variable "location" {
  type        = string
  description = "Location for the resources. Part of the naming convention."
}

variable "address_space" {
  type        = string
  description = "CIDR block for the virtual network, e.g. 10.10.0.0/16."
}

variable "subnets" {
  type        = map(number)
  description = "Map of subnet names to the number of subnets to create for each name."
}
