
output "server_ids" {
  value = openstack_compute_instance_v2.instance.id
}

output "server_access_ips" {
  value = openstack_compute_instance_v2.instance.access_ip_v4
}

output "server_access_names" {
  value = openstack_compute_instance_v2.instance.name
}
