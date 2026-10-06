provider "azurerm" {
  features {}

  resource_providers_to_register = ["Microsoft.Network"]
}

data "terraform_remote_state" "nettverk" {
  backend = "azurerm"
  config = merge(var.state_backend, {
    key = format("env/%s/nettverk.tfstate", var.environment)
  })
}

locals {
  base_name = lower(format("%s-%s-%s", var.project, var.environment, var.shortname))

  tags = {
    environment = var.environment
    owner       = var.shortname
    project     = var.project
    stack       = "app"
    managedby   = "terraform"
  }

  subnet_id = data.terraform_remote_state.nettverk.outputs.subnet_ids[var.app_subnet_key]
}

resource "azurerm_resource_group" "rg" {
  name     = format("rg-app-%s", local.base_name)
  location = var.location
  tags     = local.tags
}

resource "azurerm_network_interface" "nic" {
  name                = format("nic-app-%s", local.base_name)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
