resource "azurerm_traffic_manager_profile" "traffic-profile" {
  name                   = "app-profile2389"
  resource_group_name    = var.resource_group_name
  traffic_routing_method = "Priority"

  dns_config {
    relative_name = "app-profile2389"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443 
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

}

resource "azurerm_traffic_manager_azure_endpoint" "traffic_endpoints" {
  for_each = var.traffic_manager_endpoints
  name                 = each.key
  profile_id           = azurerm_traffic_manager_profile.traffic-profile.id
  always_serve_enabled = true
  weight               = each.value.weight
  priority = each.value.priority
  target_resource_id   = var.webapp_ids[(each.value.priority)-1]

  custom_header {
    name = "host"
    value = var.webapp_hostname[(each.value.priority)-1]
  }
  
}