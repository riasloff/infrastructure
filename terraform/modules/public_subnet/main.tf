resource "selectel_vpc_subnet_v2" "subnet_1" {
  project_id    = var.project_id
  region        = var.region
  prefix_length = var.prefix_length
  ip_version    = var.ip_version
}
