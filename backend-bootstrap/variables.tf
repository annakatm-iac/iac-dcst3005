variable "location" {
  type        = string
  default     = "westeurope"
  description = "Location for the resources."
}

variable "subscription_id" {
  type        = string
  default     = null
  description = "Subscription ID for the resources. If not provided, the default subscription will be used."
}

variable "short_name" {
  type        = string
  description = "Short name for the resources, used in resource naming."
}
