resource "azurerm_virtual_network" "vnet" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.demo_resource_location
  resource_group_name = var.resource_group_name
}