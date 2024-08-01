
provider "openstack" {
  auth_url    = var.openstack_auth_url
  domain_name = var.domain_name
  tenant_id   = var.tenant_id
  user_name   = var.user_name
  password    = var.password
  region      = var.openstack_region
}