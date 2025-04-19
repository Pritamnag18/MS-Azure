resource "azurerm_storage_account" "storage_account" {
  name                     = var.stg_name
  resource_group_name      = var.stg_rg_name
  location                 = var.stg_rg_location
  account_tier             = var.stg_account_tier
  account_replication_type = var.stg_account_replication_type

}