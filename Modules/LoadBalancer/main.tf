
# Frontend Public IP Address of the Load Balancer
resource "azurerm_public_ip" "Frontend_ip" {
  name                = "Frontend_ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Load Balancer of Standard Type with frontend ip association
resource "azurerm_lb" "load_balancer" {
  name                = "load_balancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  frontend_ip_configuration {
    name                 = "Frontend_ip"
    public_ip_address_id = azurerm_public_ip.Frontend_ip.id
  }
  depends_on = [ azurerm_public_ip.Frontend_ip ]
}

# Creation of Backend Address Pool
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "backend_pool"
  depends_on = [ azurerm_lb.load_balancer ]
}

# Addtion of Backend servers to backend pool via it's private ip addresses
resource "azurerm_lb_backend_address_pool_address" "backend_pool_address" {
  count = var.no_of_virtual_machines
  name                    = "backend_pool_address${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  virtual_network_id      = var.virtual_network_id
  ip_address              = var.network_interface_private_ip_address[count.index]
  depends_on = [ azurerm_lb_backend_address_pool.backend_pool ]
}

# Creation of health probe
resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "http-allow"
  port            = 80
  protocol = "Tcp"
  depends_on = [ azurerm_lb_backend_address_pool_address.backend_pool_address ]
}

#Creation of Load balacing rules with health probe and backend pool association with it
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "lb_rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "Frontend_ip"
  probe_id = azurerm_lb_probe.probe.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
  depends_on = [ azurerm_lb_probe.probe ]
  
}