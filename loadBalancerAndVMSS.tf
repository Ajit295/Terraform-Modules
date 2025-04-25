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