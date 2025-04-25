module "ResourceGroup" {
  source    = "./Modules/ResourceGroup"
  base_name = "Ajit-Test-Test"
  location  = "North Europe"
}

# module "StorageAccountForCustomScriptExtension" {
#   source = "./Modules/StorageAccountForCustomScriptExtension"
#   resource_group_name = module.ResourceGroup.rg_name_output
#   location = module.ResourceGroup.location_output
#   storage_account_details = var.storage_account_details
#   container_names = var.container_names
#   blobs = var.blobs
# }

# module "BackendWebapps" {
#   source              = "./Modules/TrafficManagerWithWebapp/BackendWebapps"
#   resource_group_name = module.ResourceGroup.rg_name_output
#   webapp_environment  = var.webapp_environment
# }

# module "TrafficManager" {
#   source                    = "./Modules/TrafficManagerWithWebapp/TrafficManager"
#   resource_group_name       = module.ResourceGroup.rg_name_output
#   traffic_manager_endpoints = var.traffic_manager_endpoints
#   webapp_hostname           = module.BackendWebapps.webapp_hostname
#   webapp_ids                = module.BackendWebapps.webapp_ids
# }

# module "StorageAccount" {
#     source = "./Modules/StorageAccount"
#     base_name = "terraformexample01"
#     resource_group_name = module.ResourceGroup.rg_name_output
#     location = module.ResourceGroup.location_output
# }

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
}

# module "PublicIP" {
#   source                 = "./Modules/PublicIP"
#   pip_name               = "Ajit-pip-Test"
#   resource_group_name    = module.ResourceGroup.rg_name_output
#   location               = module.ResourceGroup.location_output
#   depends_on             = [module.ResourceGroup]
#   no_of_virtual_machines = var.no_of_virtual_machines

# }

# module "NetworkInterface" {
#   source                 = "./Modules/NetworkInterface"
#   resource_group_name    = module.ResourceGroup.rg_name_output
#   location               = module.ResourceGroup.location_output
#   nic_name               = "Ajit-NIC-Test"
#   subnet_id              = module.Subnet.subnet_id
#   public_ip_address_id   = module.PublicIP.public_ip_address_id_output
#   depends_on             = [module.ResourceGroup, module.Subnet, module.PublicIP]
#   no_of_virtual_machines = var.no_of_virtual_machines
# }

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

# # module "VirtualMachine" {
# #   source                 = "./Modules/VirtualMachine"
# #   vm_name                = "Ajit-VM-Test"
# #   resource_group_name    = module.ResourceGroup.rg_name_output
# #   location               = module.ResourceGroup.location_output
# #   NIC_id                 = module.NetworkInterface.NIC_id_output
# #   depends_on             = [module.ResourceGroup, module.NetworkInterface]
# #   no_of_virtual_machines = var.no_of_virtual_machines

# # }

# module "LinuxVirtualMachine" {
#   source                 = "./Modules/LinuxVirtualMachine"
#   vm_name                = "AjitLinuxTestVm"
#   resource_group_name    = module.ResourceGroup.rg_name_output
#   location               = module.ResourceGroup.location_output
#   NIC_id                 = module.NetworkInterface.NIC_id_output
#   no_of_virtual_machines = var.no_of_virtual_machines
#   depends_on             = [module.NetworkInterface]
# }

# # module "SQLDatabase" {
# #     source = "./Modules/SQLDatabase"
# #     resource_group_name = module.ResourceGroup.rg_name_output
# #     location = module.ResourceGroup.location_output
# #     dbapp_environment = var.dbapp_environment
# #     start_ip_address = "20.204.187.56"
# #     end_ip_address = "20.204.187.56"
# #     depends_on = [module.ResourceGroup]
# # }

# # module "Webapp" {
# #     source = "./Modules/Webapp"
# #     resource_group_name = module.ResourceGroup.rg_name_output
# #     location = module.ResourceGroup.location_output
# #     webapp_environment = var.webapp_environment
# #     depends_on = [module.ResourceGroup]
# # }


# Module to create Load balancer which will run after creation of virtual machines as backend pool VM'
# module "LoadBalancer" {
#   source                               = "./Modules/LoadBalancer"
#   location                             = module.ResourceGroup.location_output
#   resource_group_name                  = module.ResourceGroup.rg_name_output
#   virtual_network_id                   = module.VirtualNetwork.virtual_network_id
#   network_interface_private_ip_address = module.NetworkInterface.network_interface_private_ip_address
#   no_of_virtual_machines               = var.no_of_virtual_machines
#   depends_on = [ module.LinuxVirtualMachine ]
# }

# module "vmss_network" {
#   source = "./Modules/VMSS"
#   resource_group_name = module.ResourceGroup.rg_name_output
#   location = module.ResourceGroup.location_output
#   subnet_id = module.Subnet.subnet_id

# }

