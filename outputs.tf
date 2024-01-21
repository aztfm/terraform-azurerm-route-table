output "id" {
  value       = azurerm_route_table.rt.id
  description = "The route table configuration ID."
}

output "name" {
  value       = azurerm_route_table.rt.name
  description = "The name of the route table."
}

output "resource_group_name" {
  value       = azurerm_route_table.rt.resource_group_name
  description = "The name of the resource group in which to create the route table."
}

output "location" {
  value       = azurerm_route_table.rt.location
  description = "The location/region where the route table is created."
}

output "tags" {
  value       = azurerm_route_table.rt.tags
  description = "The tags assigned to the resource."
}

output "routes" {
  value       = azurerm_route_table.rt.route
  description = "Blocks containing configuration of each route."
}

output "subnets" {
  value       = azurerm_route_table.rt.subnets
  description = "List of the ids of the subnets configured to the route table."
}
