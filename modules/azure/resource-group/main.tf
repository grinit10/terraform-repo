resource "azurerm_resource_group" "this" {
  name     = var.name
  location = "Australia Southeast"
  tags     = var.tags
}
