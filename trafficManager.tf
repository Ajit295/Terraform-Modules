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