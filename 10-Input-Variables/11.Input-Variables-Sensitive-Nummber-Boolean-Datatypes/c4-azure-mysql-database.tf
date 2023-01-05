# Azure MySQL Database Server
resource "azurerm_mysql_server" "mysqlserver" {
  name                = "${var.business_unit}-${var.environment}-${var.db_name}" # This needs to be globally unique within Azure.
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  administrator_login          = var.db_username
  administrator_login_password = var.db_password

  sku_name   = "B_Gen5_2"
  storage_mb = var.db_storage_mb
  version    = "8.0"

  auto_grow_enabled                 = var.db_auto_grow_enabled
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"  
  #minimum_tls_version           = "1.2"
  tags = var.common_tags
}

# resource "azurerm_mssql_server" "mysqlserver" {
#  name                = "${var.business_unit}-${var.environment}-${var.db_name}"  # This needs to be globally unique within Azure.
#   location            = azurerm_resource_group.myrg.location
#    resource_group_name = azurerm_resource_group.myrg.name
#   version                      = "12.0"
#    administrator_login          = var.db_username
#    administrator_login_password = var.db_password
#   minimum_tls_version          = "1.2"
#   #   auto_grow_enabled                 = var.db_auto_grow_enabled
# public_network_access_enabled = var.db_auto_grow_enabled
#   azuread_administrator {
#     login_username = "Jaganathan D"
#     object_id      = "37315551-6f38-40e6-8f2d-37907c23c35b"
#   }

#    tags = var.common_tags
# }

# Create Database inside Azure MySQL Database Server
resource "azurerm_mysql_database" "webappdb1" {
  name                = "webappdb1"
  resource_group_name = azurerm_resource_group.myrg.name
  server_name         = azurerm_mysql_server.mysqlserver.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}