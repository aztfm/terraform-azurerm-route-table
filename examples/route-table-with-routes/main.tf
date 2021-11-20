resource "azurerm_resource_group" "TFAZRT" {
  name     = "terraform-azurerm-route-table"
  location = "West Europe"
}

module "TFAZRT-rt" {
  source              = "./terraform-azurerm-route-table"
  name                = "TFAZRT-rt"
  resource_group_name = azurerm_resource_group.TFAZRT.name
  location            = azurerm_resource_group.TFAZRT.location
  routes = [
    { name = "route1", address_prefix = "10.0.0.0/16", next_hop_type = "VirtualAppliance", next_hop_in_ip_address = "10.0.0.4" },
    { name = "route2", address_prefix = "10.10.0.0/16", next_hop_type = "VirtualAppliance", next_hop_in_ip_address = "10.0.0.4" },
    { name = "route3", address_prefix = "0.0.0.0/0", next_hop_type = "Internet" }
  ]
  disable_bgp_route_propagation = false
}
