output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "firewall_subnet_id" {
  value = azurerm_subnet.firewall.id
}
