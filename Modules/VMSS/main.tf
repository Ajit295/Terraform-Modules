resource "azurerm_linux_virtual_machine_scale_set" "scaleSet" {
  name                = "VirtualMachineScaleSet"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard_B1s"
  instances           = 2
  admin_username      = "adminuser"
  admin_password = "Ajit@23091998"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "vmss_network"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id[0]
    }
  }

  custom_data = base64encode(file("Modules/VMSS/cloud-init.yaml"))

}