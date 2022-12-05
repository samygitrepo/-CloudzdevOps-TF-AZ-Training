# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  for_each = toset(["eastus", "eastus2", "westus"])
  name     = "myrg-${each.key}"
  location = each.value
}
/* 
we can also use each.value as each.key = each.value 
in this case  
*/