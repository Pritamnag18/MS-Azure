
resource "azurerm_subnet" "snet_pep" {
  name  = var.snet_pep_name
  resource_group_name =  var.vnet_rg_name
  virtual_network_name =  var.vnet_name
  address_prefixes =  var.snet_pep_address_prefix
}
resource "azurerm_subnet" "snet_asp" {
  name  = var.snet_asp_name
  resource_group_name =  var.vnet_rg_name
  virtual_network_name =  var.vnet_name
  address_prefixes =  var.snet_asp_address_prefix
}