resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location  = var.demo_resource_location
}