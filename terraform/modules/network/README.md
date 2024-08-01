# Project

Terraform module for creating a full Selectel network (router, network, private subnet, interface).

## Variables

  * `router_name` - Name of the Selectel router (Default: "router-1").

  * `network_name` - Name of the Selectel private network (Default: "private-network").

  * `subnet_name` - Name of the Selectel private subnet (Default: "private-subnet").

  * `subnet_cidr` - Type of the Selectel subnet cidr (Default: "192.168.199.0/24").
  
## Outputs

  * `network_id` - ID of the created Selectel network.

  * `subnet_id` - ID of the created Selectel subnet.
  
  