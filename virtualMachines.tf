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
# }