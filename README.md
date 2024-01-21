<!-- markdownlint-disable MD013 -->
# Azure Route Table - Terraform Module

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![Terraform Registry](https://img.shields.io/badge/Terraform-registry-blueviolet.svg?logo=terraform)](https://registry.terraform.io/modules/aztfm/route-table/azurerm/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aztfm/terraform-azurerm-route-table?label=Release)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/aztfm/terraform-azurerm-route-table?quickstart=1)

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 2.x.x       | >= 1.3.x          | >= 2.0.0        |
| >= 1.x.x       | >= 0.13.x         | >= 2.0.0        |

<!-- BEGIN_TF_DOCS -->
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

| Name                       | Description |   Type   | Default | Required |
| -------------------------- | ----------- | :------: | :-----: | :------: |
| name                       |             | `string` |   n/a   |   yes    |
| address\_prefix            |             | `number` |   n/a   |   yes    |
| next\_hop\_type            |             | `string` |   n/a   |   yes    |
| next\_hop\_in\_ip\_address |             | `string` | `null`  |    no    |

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
<!-- END_TF_DOCS -->
