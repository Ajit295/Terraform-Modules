module "StorageAccountForCustomScriptExtension" {
  source                  = "./Modules/StorageAccountForCustomScriptExtension"
  resource_group_name     = module.ResourceGroup.rg_name_output
  location                = module.ResourceGroup.location_output
  storage_account_details = var.storage_account_details
  container_names         = var.container_names
  blobs                   = var.blobs
  depends_on              = [module.ResourceGroup]
}

# module "StorageAccount" {
#     source = "./Modules/StorageAccount"
#     base_name = "terraformexample01"
#     resource_group_name = module.ResourceGroup.rg_name_output
#     location = module.ResourceGroup.location_output
# }

output "blob_name" {
  value = module.StorageAccountForCustomScriptExtension.blob_names
}
