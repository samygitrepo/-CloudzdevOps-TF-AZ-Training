# Resource Block
# Create a resource group
resource "azurerm_resource_group" "myrg2" {
  name     = "myrg-100"
  location = "East US"
}