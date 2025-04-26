resource "azurerm_linux_virtual_machine" "Linux-VM" {
  count = var.no_of_virtual_machines
  name                = "${var.vm_name}${count.index+1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password = "Ajit@23091998"
  disable_password_authentication = false
  network_interface_ids = [
    var.NIC_id[count.index]
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "script" {
  count = var.no_of_virtual_machines
  name                 = "install-nginx"
  virtual_machine_id   = azurerm_linux_virtual_machine.Linux-VM[count.index].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

settings = jsonencode({
    fileUris         = ["https://${var.storage_account_name}.blob.core.windows.net/${var.container_name}/${var.blob_names[count.index]}"]
    commandToExecute = "sh ${var.blob_names[count.index]}"
  })


depends_on = [ azurerm_linux_virtual_machine.Linux-VM ]
}