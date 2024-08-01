
resource "openstack_compute_instance_v2" "instance" {
  name              = var.server_name
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = var.key_pair
  availability_zone = var.availability_zone
  
  user_data = file("${path.module}/bootstrap.sh")

  network {
    port = var.port_id
  }

  lifecycle {
    ignore_changes = [image_id]
  }

  block_device {
    uuid             = var.block_device_id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }

  vendor_options {
    ignore_resize_confirmation = true
  }
}

