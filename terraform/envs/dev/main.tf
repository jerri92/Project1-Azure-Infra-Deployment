resource "azurerm_resource_group" "rg" {
  name     = "rg-hub-spoke-dev"
  location = var.location
  tags     = var.tags
}

module "hub" {
  source              = "../../modules/network-hub"
  name                = "hub-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags
}

module "spoke_app" {
  source              = "../../modules/network-spoke"
  name                = "spoke-app-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  address_space       = ["10.1.0.0/16"]
  tags                = var.tags
}

module "spoke_data" {
  source              = "../../modules/network-spoke"
  name                = "spoke-data-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  address_space       = ["10.2.0.0/16"]
  tags                = var.tags
}

module "firewall" {
  source              = "../../modules/firewall"
  name                = "hub-fw"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.hub.firewall_subnet_id
  tags                = var.tags
}

module "peering_app" {
  source                = "../../modules/peering"
  vnet_a_id             = module.hub.vnet_id
  vnet_b_id             = module.spoke_app.vnet_id
}

module "peering_data" {
  source                = "../../modules/peering"
  vnet_a_id             = module.hub.vnet_id
  vnet_b_id             = module.spoke_data.vnet_id
}
