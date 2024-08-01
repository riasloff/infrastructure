variable "server_name" {
  description = "default server name"
  type        = string
  default     = "tf_server"
}

variable "availability_zone" {
  description = "default availability zone name"
  type        = string
  default     = "ru-9a"
}

variable "key_pair" {}

variable "port_id" {}

variable "flavor_id" {}

variable "image_id" {}

variable "block_device_id" {}