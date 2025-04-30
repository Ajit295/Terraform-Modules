output "blob_names" {
  value = [for blob in azurerm_storage_blob.blobs : blob.name ][0]
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "container_name" {
  value = "scripts"
}