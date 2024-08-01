# Flavor

Terraform module for creating a single OpenStack Compute V2 Flavor.

## Variables

  * `flavor_name` - Name of the OpenStack Compute Flavor (Default: "tf_flavor").

  * `flavor_vcpus` - Amount of VCPUs for the OpenStack Compute Flavor
  (Default: 1).

  * `flavor_ram_mb` - Amount of RAM for the OpenStack Compute Flavor
  (Default: 2048).

  * `flavor_local_disk_gb` - Amount of GB for local storage of the OpenStack
  Compute Flavor (Default: 0).

## Outputs

  * `flavor_id` - ID of the created OpenStack Flavor.