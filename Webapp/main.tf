

resource "azurerm_windows_web_app" "windows_web_app" {
  name                = var.wap_name
  resource_group_name = var.wap_rg_name
  location            = var.wap_rg_location
  service_plan_id     = var.wap_asp_id

  site_config {}
}