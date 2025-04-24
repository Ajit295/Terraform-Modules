resource "azurerm_service_plan" "backend_webapp_service_plan" {
  for_each = var.webapp_environment
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = each.value.service_plan_location
  sku_name            = each.value.service_plan_sku_name
  os_type             = each.value.service_plan_os_type
}

resource "azurerm_windows_web_app" "backend_webapps" {
  for_each = var.webapp_environment
  name                = each.value.webapp_name
  resource_group_name = var.resource_group_name
  location            = each.value.service_plan_location
  service_plan_id     = azurerm_service_plan.backend_webapp_service_plan[each.key].id

  site_config {
    always_on = false
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v8.0"
    }
  }

  depends_on = [ azurerm_service_plan.backend_webapp_service_plan ]
}