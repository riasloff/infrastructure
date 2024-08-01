
module "project" {
  source       = "./modules/project"
  project_name = var.project_name
}

module "user" {
  source                = "./modules/user"
  project_user_name     = var.project_user_name
  project_user_password = var.project_user_password
  project_id            = module.project.project_id
}

module "keypair" {
  source             = "./modules/keypair"
  keypair_name       = var.keypair_name
  keypair_user_id    = module.user.user_id
  keypair_public_key = file("~/.ssh/id_rsa.pub")
}

module "flavor_in_ru" {
  source = "./modules/flavor"

  openstack_auth_url = var.openstack_auth_url
  domain_name        = var.selectel_account_number
  tenant_id          = module.project.project_id
  user_name          = var.project_user_name
  password           = var.project_user_password
  openstack_region   = "ru-9"

  flavor_name          = var.flavor_name
  flavor_vcpus         = var.server_vcpus
  flavor_ram_mb        = var.server_ram_mb
  flavor_local_disk_gb = 0

  project_id = module.project.project_id
  user_id    = module.user.user_id
}

module "flavor_in_kz" {
  source = "./modules/flavor"

  openstack_auth_url = var.openstack_auth_url
  domain_name        = var.selectel_account_number
  tenant_id          = module.project.project_id
  user_name          = var.project_user_name
  password           = var.project_user_password
  openstack_region   = "kz-1"

  flavor_name          = var.flavor_name
  flavor_vcpus         = var.server_vcpus
  flavor_ram_mb        = var.server_ram_mb
  flavor_local_disk_gb = 0

  project_id = module.project.project_id
  user_id    = module.user.user_id
}

module "public_subnet_in_ru" {
  source     = "./modules/public_subnet"
  project_id = module.project.project_id
  region     = "ru-9"
}

module "public_subnet_in_kz" {
  source     = "./modules/public_subnet"
  project_id = module.project.project_id
  region     = "kz-1"
}

module "instance_k8s_master_01" {
  source = "./modules/instance_k8s"

  server_name = "ru-k8s-master-01"

  openstack_auth_url = var.openstack_auth_url
  domain_name        = var.selectel_account_number
  tenant_id          = module.project.project_id
  user_name          = var.project_user_name
  password           = var.project_user_password
  openstack_region   = "ru-9"
  availability_zone  = "ru-9a"
  volume_type        = "universal.ru-9a"

  network_id = module.public_subnet_in_ru.network_id
  subnet_id  = module.public_subnet_in_ru.subnet_id

  key_pair   = module.keypair.keypair_name
  flavor_id  = module.flavor_in_ru.flavor_id
  image_name = var.image_name
  disk_gb    = var.disk_gb

  project_id = module.project.project_id
  user_id    = module.user.user_id
}

module "instance_k8s_worker_01" {
  source = "./modules/instance_k8s"

  server_name = "ru-k8s-worker-01"

  openstack_auth_url = var.openstack_auth_url
  domain_name        = var.selectel_account_number
  tenant_id          = module.project.project_id
  user_name          = var.project_user_name
  password           = var.project_user_password
  openstack_region   = "ru-9"
  availability_zone  = "ru-9a"
  volume_type        = "universal.ru-9a"

  network_id = module.public_subnet_in_ru.network_id
  subnet_id  = module.public_subnet_in_ru.subnet_id

  key_pair   = module.keypair.keypair_name
  flavor_id  = module.flavor_in_ru.flavor_id
  image_name = var.image_name
  disk_gb    = var.disk_gb

  project_id = module.project.project_id
  user_id    = module.user.user_id
}

module "instance_k8s_worker_02" {
  source = "./modules/instance_k8s"

  server_name = "kz-k8s-worker-02"

  openstack_auth_url = var.openstack_auth_url
  domain_name        = var.selectel_account_number
  tenant_id          = module.project.project_id
  user_name          = var.project_user_name
  password           = var.project_user_password
  openstack_region   = "kz-1"
  availability_zone  = "kz-1a"
  volume_type        = "universal.kz-1a"

  network_id = module.public_subnet_in_kz.network_id
  subnet_id  = module.public_subnet_in_kz.subnet_id

  key_pair   = module.keypair.keypair_name
  flavor_id  = module.flavor_in_kz.flavor_id
  image_name = var.image_name
  disk_gb    = var.disk_gb

  project_id = module.project.project_id
  user_id    = module.user.user_id
}