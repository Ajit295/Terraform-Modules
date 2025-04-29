resource "azurerm_public_ip" "app_gateway_public_ip" {
  name                = "app_gateway_public_ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_subnet" "defaultGatewaySubnet" {
  name                 = var.gateway_subnet_details[0]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.gateway_subnet_details[1]
  address_prefixes     = var.gateway_subnet_details[2]
}

resource "azurerm_application_gateway" "appgateway" {
  name                = "app-gateway"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-configuration"
    subnet_id = azurerm_subnet.defaultGatewaySubnet.id
  }

  frontend_port {
    name = "gateway-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "gateway-frontend-ip"
    public_ip_address_id = azurerm_public_ip.app_gateway_public_ip.id
  }

  backend_address_pool {
    name = "local.backend_address_pool_name"
  }

  backend_http_settings {
    name                  = "HTTPsetting"
    cookie_based_affinity = "Disabled"
    path                  = ""
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "gateway-listner"
    frontend_ip_configuration_name = "gateway-frontend-ip"
    frontend_port_name             = "gateway-frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "gateway-routing-rule"
    priority                   = 100
    rule_type                  = "PathBasedRouting"
    http_listener_name         = "gateway-listner"
  }
}