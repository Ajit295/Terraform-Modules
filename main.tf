module "ResourceGroup" {
  source    = "./Modules/ResourceGroup"
  base_name = "Ajit-Test-Test"
  location  = "North Europe"
}

module "VirtualNetwork" {
  source              = "./Modules/VirtualNetwork"
  base_name           = "Ajit-Test-Vnet"
  resource_group_name = module.ResourceGroup.rg_name_output
  location            = module.ResourceGroup.location_output
  depends_on          = [module.ResourceGroup]
}

module "Subnet" {
  source               = "./Modules/Subnets"
  resource_group_name  = module.ResourceGroup.rg_name_output
  virtual_network_name = module.VirtualNetwork.Vnet_name_output
  subnet_names         = var.subnet_names
  depends_on           = [module.ResourceGroup, module.VirtualNetwork]
}

module "PublicIP" {
  source                 = "./Modules/PublicIP"
  pip_name               = "Ajit-pip-Test"
  resource_group_name    = module.ResourceGroup.rg_name_output
  location               = module.ResourceGroup.location_output
  depends_on             = [module.ResourceGroup]
  no_of_virtual_machines = var.no_of_virtual_machines

}

module "NetworkInterface" {
  source                 = "./Modules/NetworkInterface"
  resource_group_name    = module.ResourceGroup.rg_name_output
  location               = module.ResourceGroup.location_output
  nic_names               = var.nic_names
  subnet_id              = module.Subnet.subnet_id
  public_ip_address_id   = module.PublicIP.public_ip_address_id_output
  depends_on             = [module.ResourceGroup, module.Subnet, module.PublicIP]
  no_of_virtual_machines = var.no_of_virtual_machines
}

output "nic_names" {
  value = module.NetworkInterface.nic_details
}

# module "NSG" {
#   source                 = "./Modules/NSG"
#   nsg_name               = "Ajit-NSG-Test"
#   resource_group_name    = module.ResourceGroup.rg_name_output
#   location               = module.ResourceGroup.location_output
#   Allow_security_rules   = var.Allow_security_rules
#   subnet_id              = module.Subnet.subnet_id
#   depends_on             = [module.ResourceGroup, module.Subnet]
#   no_of_virtual_machines = var.no_of_virtual_machines
# }

# module "VirtualMachine" {
#   source                 = "./Modules/VirtualMachine"
#   vm_name                = "Ajit-VM-Test"
#   resource_group_name    = module.ResourceGroup.rg_name_output
#   location               = module.ResourceGroup.location_output
#   NIC_id                 = module.NetworkInterface.NIC_id_output
#   depends_on             = [module.ResourceGroup, module.NetworkInterface]
#   no_of_virtual_machines = var.no_of_virtual_machines

# }

# module "LinuxVirtualMachine" {
#   source                 = "./Modules/LinuxVirtualMachine"
#   vm_name                = "AjitLinuxTestVm"
#   resource_group_name    = module.ResourceGroup.rg_name_output
#   location               = module.ResourceGroup.location_output
#   NIC_id                 = module.NetworkInterface.NIC_id_output
#   no_of_virtual_machines = var.no_of_virtual_machines
#   depends_on             = [module.NetworkInterface]
#   storage_account_name   = module.StorageAccountForCustomScriptExtension.storage_account_name
#   container_name         = module.StorageAccountForCustomScriptExtension.container_name
#   blob_names             = module.StorageAccountForCustomScriptExtension.blob_names
# }

