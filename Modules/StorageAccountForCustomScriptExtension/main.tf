
# Create random integer for storage account name
resource "random_integer" "storage_account_suffix" {
  min = 900000
  max = 1000000
}

# Create storage account name
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_details["account_prefix"]}${random_integer.storage_account_suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_details["account_tier"]
  account_replication_type = var.storage_account_details["account_replication_type"]
  account_kind = var.storage_account_details["account_kind"]
}

# Create storage account container of type blob
resource "azurerm_storage_container" "container" {
  for_each = toset(var.container_names)
  name                  = each.key
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "blob"
  depends_on = [ azurerm_storage_account.storage_account ]
}

# Resource to upload the script files (blobs) to the storage container
resource "azurerm_storage_blob" "blobs" {
  for_each = var.blobs
  name                   = each.key
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = each.value.container_name
  type                   = "Block"
  source                 = each.value.blob_location
  depends_on = [ azurerm_storage_container.container ]
}