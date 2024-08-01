variable "selectel_account_number" {
  type        = string
  default     = "310336"
  description = "general selectel account number"
  sensitive   = true
}

variable "selectel_svc_username" {
  type        = string
  default     = "Brenda"
  description = "selectel service account username"
  sensitive   = true
}

variable "selectel_svc_password" {
  type        = string
  default     = ""
  description = "selectel service account password"
  sensitive   = true
}

variable "project_name" {
  type    = string
  default = "tf-project"
}

variable "project_user_name" {
  type    = string
  default = "tf-user"
}

variable "project_user_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "keypair_name" {
  type    = string
  default = "tf-keypair"
}

variable "image_name" {
  default = "Ubuntu 22.04 LTS 64-bit"
}

variable "openstack_auth_url" {
  type        = string
  default     = "https://cloud.api.selcloud.ru/identity/v3"
  description = "openstack url for auth"
  sensitive   = true
}

variable "openstack_region" {
  type        = string
  default     = "ru-9"
  description = "openstack default region"
}

variable "flavor_name" {
  default = "tf-flavor"
}

variable "server_vcpus" {
  default = 1
}

variable "server_ram_mb" {
  default = 1536
}

variable "disk_gb" {
  default = 20
}

