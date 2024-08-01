
provider "selectel" {
  domain_name = var.selectel_account_number
  username    = var.selectel_svc_username
  password    = var.selectel_svc_password
}

provider "openstack" {
  auth_url    = var.openstack_auth_url
  domain_name = var.selectel_account_number
  tenant_id   = module.project.project_id
  user_name   = var.project_user_name
  password    = var.project_user_password
  region      = var.openstack_region
}