# terraform import azurerm_resource_group.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example

# Resource Group
resource "azurerm_resource_group" "myrg" {
   name = "myrg1"
   location = "eastus"
}


