provider "azurerm" {
  features {}
}

run "setup" {
  module {
    source = "./tests/environment"
  }
}

variables {
  disable_bgp_route_propagation = false
  routes = [{
    name                   = "route1"
    address_prefix         = "10.0.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.0.4"
    }, {
    name           = "route2"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }]
}

run "plan" {
  command = plan

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
  }

  assert {
    condition     = azurerm_virtual_network.vnet.name == run.setup.workspace_id
    error_message = "The route table name input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.resource_group_name == run.setup.resource_group_name
    error_message = "The route table resource group input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.location == run.setup.resource_group_location
    error_message = "The route table location input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.disable_bgp_route_propagation == false
    error_message = ""
  }

  assert {
    condition     =  azurerm_route.routes["route1"].name == ({ for r in var.routes : r.name => r })["route1"].name
    error_message = ""
  }

  assert {
    condition     =  azurerm_route.routes["route1"].address_prefix == ({ for r in var.routes : r.name => r })["route1"].address_prefix
    error_message = ""
  }

  assert {
    condition     =  azurerm_route.routes["route1"].next_hop_type == ({ for r in var.routes : r.name => r })["route1"].next_hop_type
    error_message = ""
  }

  assert {
    condition     =  azurerm_route.routes["route1"].next_hop_in_ip_address == ({ for r in var.routes : r.name => r })["route1"].next_hop_in_ip_address
    error_message = ""
  }

  assert {
    condition     =  azurerm_route.routes["route2"].name == ({ for r in var.routes : r.name => r })["route2"].name
    error_message = ""
  }

  assert {
    condition     =  azurerm_route.routes["route2"].address_prefix == ({ for r in var.routes : r.name => r })["route2"].address_prefix
    error_message = ""
  }

  assert {
    condition     =  azurerm_route.routes["route2"].next_hop_type == ({ for r in var.routes : r.name => r })["route2"].next_hop_type
    error_message = ""
  }
}

run "apply" {
  command = apply

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
  }
}
