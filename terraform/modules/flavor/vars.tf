
variable "openstack_auth_url" {}

variable "domain_name" {}

variable "tenant_id" {}

variable "user_name" {}

variable "password" {}

variable "openstack_region" {}

variable "project_id" {}

variable "user_id" {}

variable "flavor_name" {
  description = "flavor name"
  type        = string
  default     = "tf_flavor"
}

variable "flavor_vcpus" {
  description = "number of cpu"
  type        = number
  default     = 1
}

variable "flavor_ram_mb" {
  description = "number of ram in mb"
  type        = number
  default     = 2048
}

variable "flavor_local_disk_gb" {
  description = "number of local storage in gb"
  type        = number
  default     = 0
}

variable "flavor_is_public" {
  description = "flavor is public"
  type        = bool
  default     = false
}