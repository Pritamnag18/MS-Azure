locals {
  full_name = "${var.offer_name}-${var.environment_name}"
  full_name1 = "${var.offer_name}${var.environment_name}"
  default_tags={
    offer_name =var.offer_name
    environment_name= var.environment_name
    Description = "Resource terraformed for ${local.full_name}"
    Description1 = "Resource terraformed for ${local.full_name1}"
    Terraform = "true"
  }
}
module "virtual_network" {
  source = "./Virtual_network"
  vnet_address_space =  ["10.0.0.0/16"]
  vnet_name =  "vnet-${local.full_name}-02"
  vnet_rg_location =  data.azurerm_resource_group.resource_group.location
  vnet_rg_name =  data.azurerm_resource_group.resource_group.name
 
}
module "azurerm_subnet" {
  depends_on = [ module.virtual_network ]
  source = "./subnet"
  snet_asp_address_prefix =   ["10.0.2.0/24"]
  snet_asp_name =  "asp-snet-${local.full_name}-02"
  snet_pep_address_prefix =  ["10.0.1.0/24"] 
  snet_pep_name = "pep-snet-${local.full_name}-01"
  vnet_rg_name =  data.azurerm_resource_group.resource_group.name
  vnet_name =  module.virtual_network.vnet_name

}

data "azurerm_resource_group" "resource_group" {
  name = "learn-487ff27c-9360-4d22-b3bf-7943f3a491e7"
}

module "azurerm_windows_webapp" {
  depends_on = [ module.azurerm_windows_app_service_plan ]
  source = "./Webapp"
  wap_asp_id = module.azurerm_windows_app_service_plan.asp_id
  wap_name =  "wap-${local.full_name}-01"
  wap_rg_location = data.azurerm_resource_group.resource_group.location
  wap_rg_name = data.azurerm_resource_group.resource_group.name
}

module "azurerm_windows_app_service_plan" {
  source = "./appserviceplan"
  asp_name =  "asp-${local.full_name}-01"
  asp_os_type =  "Windows"
  asp_rg_location =  data.azurerm_resource_group.resource_group.location 
  asp_rg_name =  data.azurerm_resource_group.resource_group.name
  asp_sku = "S1"
}

module "azurerm_storage_account" {
  source = "./Storage_account"
  stg_account_replication_type = "GRS"
  stg_account_tier =  "Standard"
  stg_name =  "stg${local.full_name1}01"
  stg_rg_location =  data.azurerm_resource_group.resource_group.location 
  stg_rg_name = data.azurerm_resource_group.resource_group.name
}