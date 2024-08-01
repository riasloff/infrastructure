# Project

Terraform module for creating a public Selectel subnet.

## Variables

  * `project_id` - Id of the Selectel project (Default: " ").

  * `region` - Region of the Selectel project (Default: " ").

  * `prefix_length` - Lenght of the Selectel subnet (Default: 29).

  * `ip_version` - Type of the Selectel ip version (Default: "ipv4").

## Outputs

  * `network_id` - ID of the created Selectel network.

  * `subnet_id` - ID of the created Selectel subnet.

  * `subnet_cidr` - Subnet cidr of the created Selectel network.
  
  