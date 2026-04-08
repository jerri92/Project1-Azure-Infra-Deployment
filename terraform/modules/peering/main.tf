resource "azurerm_virtual_network_peering" "peer_a_to_b" {
  virtual_network_name      = data.azurerm_virtual_network.vnet_a.name
  resource_group_name       = data.azurerm_virtual_network.vnet_a.resource_group_name
  remote_virtual_network_id = var.vnet_b_id
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "peer_b_to_a" {
  virtual_network_name      = data.azurerm_virtual_network.vnet_b.name
  resource_group_name       = data.azurerm_virtual_network.vnet_b.resource_group_name
  remote_virtual_network_id = var.vnet_a_id
  allow_forwarded_traffic   = true
}
