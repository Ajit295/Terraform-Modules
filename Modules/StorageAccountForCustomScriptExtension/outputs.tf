output "blob_names" {
  value = values(azurerm_storage_blob.blobs)[*].name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "container_name" {
  value = "scripts"
}