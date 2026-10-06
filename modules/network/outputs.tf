output "subnet_ids" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.id }
  description = "Subnet ID per subnet name."
}

output "subnet_prefixes" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.address_prefixes[0] }
  description = "Calculated address prefix per subnet name."
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID of the virtual network."
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Name of the virtual network."
}
