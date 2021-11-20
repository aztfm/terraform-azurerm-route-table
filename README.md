# Azure Route Table - Terraform Module
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/aztfm/terraform-azurerm-route-table/Release?label=Testing&logo=GitHub)
[![Terraform Registry](https://img.shields.io/badge/Terraform-registry-blueviolet.svg?logo=terraform)](https://registry.terraform.io/modules/aztfm/route-table/azurerm/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aztfm/terraform-azurerm-route-table?label=Release)

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 1.x.x       | >= 0.13.x         | >= 2.0.0        |

## Parameters

The following parameters are supported:

| Name                             | Description                                                                           |        Type         | Default | Required |
| -------------------------------- | ------------------------------------------------------------------------------------- | :-----------------: | :-----: | :------: |
| name                             | The name of the route table.                                                          |      `string`       |   n/a   |   yes    |
| resource\_group\_name            | The name of the resource group in which to create the route table.                    |      `string`       |   n/a   |   yes    |
| location                         | The location/region where the route table is created.                                 |      `string`       |   n/a   |   yes    |
| routes                           | List of objects that represent the configuration of each route.                       | `list(map(string))` |  `[]`   |    no    |
| disable\_bgp\_route\_propagation | Boolean flag which controls propagation of routes learned by BGP on that route table. |       `bool`        | `true`  |    no    |
| tags                             | A mapping of tags to assign to the resource.                                          |    `map(string)`    |  `{}`   |    no    |

The `routes` supports the following:

| Name                       | Description                                                                                                                                              |   Type   | Default | Required |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: | :-----: | :------: |
| name                       | The name of the route.                                                                                                                                   | `string` |   n/a   |   yes    |
| address\_prefix            | The destination CIDR to which the route applies.                                                                                                         | `number` |   n/a   |   yes    |
| next\_hop\_type            | The type of Azure hop the packet should be sent to. Possible values are `VirtualNetworkGateway`, `VnetLocal`, `Internet`, `VirtualAppliance` and `None`. | `string` |   n/a   |   yes    |
| next\_hop\_in\_ip\_address | Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is `VirtualAppliance`.        | `string` | `null`  |    no    |

## Outputs

The following outputs are exported:

| Name                  | Description                                                        |
| --------------------- | ------------------------------------------------------------------ |
| id                    | The route table configuration ID.                                  |
| name                  | The name of the route table.                                       |
| resource\_group\_name | The name of the resource group in which to create the route table. |
| location              | The location/region where the route table is created.              |
| routes                | Blocks containing configuration of each route.                     |
| subnets               | List of the ids of the subnets configured to the route table.      |
| tags                  | The tags assigned to the resource.                                 |
