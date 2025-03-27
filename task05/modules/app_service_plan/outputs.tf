output "id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_service_plan.asp.id
}

output "name" {
  description = "The name of the App Service Plan"
  value       = azurerm_service_plan.asp.name
}