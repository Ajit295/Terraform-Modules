# Modules to deploy Webapp for multiple environments eg. Production and Staging

resource "azurerm_service_plan" "serviceplan" {
  for_each            = merge(var.webapp_environment.production.serviceplan, var.webapp_environment.staging.serviceplan)
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku
}

resource "azurerm_windows_web_app" "webapp" {
  for_each            = merge(var.webapp_environment.production.serviceapp, var.webapp_environment.staging.serviceapp)
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.serviceplan[each.value].id

  site_config {
    always_on = false
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v8.0"
    }
  }

  depends_on = [azurerm_service_plan.serviceplan]
}
