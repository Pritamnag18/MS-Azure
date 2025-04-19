resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.vnet_rg_location
  resource_group_name = var.vnet_rg_name
  address_space       = var.vnet_address_space
}
