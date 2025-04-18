resource "azurerm_windows_virtual_machine" "windows-vm" {
  count = var.no_of_virtual_machines
  name                = "${var.vm_name}${count.index+1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1ms"
  admin_username      = "Ajit"
  admin_password      = "Adminuser@2954"
  network_interface_ids = [
    var.NIC_id[count.index],
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}