resource "azurerm_service_plan" "service_plan" {
  name                = var.asp_name
  resource_group_name = var.asp_rg_name
  location            = var.asp_rg_location
  sku_name            = var.asp_sku # "P1v2" #need to check
  os_type             = var.asp_os_type #"Windows"
}


