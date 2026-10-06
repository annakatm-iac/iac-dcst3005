output "subnet_ids" {
  value       = module.network.subnet_ids
  description = "Subnet ID per subnet name. Consumed by the app stack."
}

output "vnet_name" {
  value       = module.network.vnet_name
  description = "Name of the virtual network. Read by the verification step."
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource group owned by the stack. Read by the verification step."
}

output "subnet_prefixes" {
  value       = module.network.subnet_prefixes
  description = "Calculated address prefix per subnet."
}
