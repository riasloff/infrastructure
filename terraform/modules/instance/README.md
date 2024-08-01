# Project

Terraform module for creating a Selectel instance.

## Variables

  * `server_name` - Name of the Selectel server (Default: "tf_server").

  * `availability_zone` - Name of the Selectel zone (Default: "ru-9a").

  * `key_pair` - Name of the Selectel keypair.

  * `port_id` - ID of the Selectel port.
  
  * `flavor_id` - ID of the Selectel flavor.

  * `image_id` - ID of the Selectel image.

  * `block_device_id` - ID of the block device.

## Outputs

  * `server_ids` - ID's of the servers.

  * `server_access_ips` - IP addresses of the servers.

  * `server_access_names` - Names of the servers access.