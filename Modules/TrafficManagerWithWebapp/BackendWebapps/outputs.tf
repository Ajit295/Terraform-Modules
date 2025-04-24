output "webapp_ids" {
  value = values(azurerm_windows_web_app.backend_webapps)[*].id
}

output "webapp_hostname" {
  value = values(azurerm_windows_web_app.backend_webapps)[*].default_hostname
}