output "web_app_url" {
  description = "The URL of the deployed Web App"
  value       = "https://${azurerm_app_service.app.default_site_hostname}"
}
