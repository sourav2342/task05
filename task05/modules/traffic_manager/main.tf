resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method
  tags                   = var.tags

  dns_config {
    relative_name = var.name
    ttl           = 60
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoint" {
  count              = length(var.endpoints)
  name               = var.endpoints[count.index].name
  profile_id         = azurerm_traffic_manager_profile.tm.id
  target_resource_id = var.endpoints[count.index].target
  enabled            = var.endpoints[count.index].enabled
}
