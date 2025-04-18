resource "azurerm_mssql_server" "mssql_server" {
  for_each                     = var.dbapp_environment.production.server
  name                         = each.key
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  

}

resource "azurerm_mssql_database" "appdb" {
  for_each     = var.dbapp_environment.production.server
  name         = each.value.dbname
  server_id    = azurerm_mssql_server.mssql_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = each.value.sku
  depends_on = [azurerm_mssql_server.mssql_server]

}

resource "azurerm_mssql_firewall_rule" "AllowClientIP" {
  name             = "AllowClientIP"
  server_id        = azurerm_mssql_server.mssql_server["server895648"].id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
  depends_on = [ azurerm_mssql_server.mssql_server,azurerm_mssql_database.appdb ]
}
