<!-- markdownlint-disable MD041 MD013 -->
## 2.0.0 (January 21, 2024)

BREAKING CHANGES:

* dependencies: updating to `v1.3.0` minimum of `terraform`.

ENHANCEMENTS:

* Internal changes that change the way data is received by child parameters, but do not change the behavior of the module.
* The routes defined in the route table are now a apart resource, this going to recreate the routes of the route tables created with versions before to `2.0.0`.

## 1.0.1 (November 28, 2021)

ENHANCEMENTS:

* Internal changes that do not modify the operation of the module.

## 1.0.0 (November 14, 2020)

FEATURES:

* **New Parameter:** `name`
* **New Parameter:** `resource_group_name`
* **New Parameter:** `location`
* **New Parameter:** `routes`
* **New Parameter:** `routes.name`
* **New Parameter:** `routes.address_prefix`
* **New Parameter:** `routes.next_hop_type`
* **New Parameter:** `routes.next_hop_in_ip_address`
* **New Parameter:** `disable_bgp_route_propagation`
* **New Parameter:** `tags`
