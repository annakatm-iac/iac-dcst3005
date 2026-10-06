output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource group owned by the app stack. Read by the verification step."
}

output "nic_name" {
  value       = azurerm_network_interface.nic.name
  description = "Name of the network interface. Read by the verification step."
}

output "private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "Private IP address assigned to the network interface in the app subnet."
}

output "brukt_subnet_id" {
  value       = local.subnet_id
  description = "Subnet ID read from the network stack state."
}
