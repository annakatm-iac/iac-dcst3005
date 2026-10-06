variable "rg_name" {
  type        = string
  description = "Name of the resource group to create the resources in."
}

variable "location" {
  type        = string
  description = "Location for the resources."
}

variable "base_name" {
  type        = string
  description = "Base name for the resources, used as a prefix for resource names."
}

variable "address_space" {
  type        = string
  description = "CIDR block for the virtual network, e.g. 10.10.0.0/16."

  validation {
    condition     = can(cidrhost(var.address_space, 0))
    error_message = "The address_space variable must be a valid CIDR block, e.g."
  }
}

variable "subnets" {
  type        = map(number)
  description = "Map of subnet names to the number of subnets to create for each name. The number of subnets will be used to calculate the subnet CIDR blocks based on the address_space and subnet_newbits variables."
}

variable "subnet_newbits" {
  type        = number
  default     = 8
  description = "Number of new bits to use for subnetting the address_space. For example, if the address_space is"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the resources."
}
