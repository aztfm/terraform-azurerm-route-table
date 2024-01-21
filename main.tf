resource "azurerm_route_table" "rt" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  tags                          = var.tags
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
}

resource "azurerm_route" "routes" {
  for_each               = { for route in var.routes : route.name => route }
  name                   = each.value.name
  resource_group_name    = azurerm_route_table.rt.resource_group_name
  route_table_name       = azurerm_route_table.rt.name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}
