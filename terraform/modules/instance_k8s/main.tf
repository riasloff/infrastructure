
module "image_datasource" {
  source     = "../image_datasource"
  image_name = var.image_name

  depends_on = [
    var.project_id,
    var.user_id
  ]
}

resource "openstack_networking_port_v2" "port_1" {
  name       = "eth0-${var.server_name}"
  network_id = var.network_id

  fixed_ip {
    subnet_id = var.subnet_id
  }

  depends_on = [
    var.project_id,
    var.user_id
  ]
}

resource "openstack_blockstorage_volume_v3" "volume_1" {
  name              = "disk0-${var.server_name}"
  size              = var.disk_gb
  image_id          = module.image_datasource.image_id
  availability_zone = var.availability_zone
  volume_type       = var.volume_type

  depends_on = [
    var.project_id,
    var.user_id
  ]
}

resource "openstack_compute_instance_v2" "instance" {
  name              = var.server_name
  image_id          = module.image_datasource.image_id
  flavor_id         = var.flavor_id
  key_pair          = var.key_pair
  availability_zone = var.availability_zone
  
  user_data = file("${path.module}/k8s-bootstrap.sh")

  network {
    port = openstack_networking_port_v2.port_1.id
  }

  lifecycle {
    ignore_changes = [image_id]
  }

  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume_1.id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }

  vendor_options {
    ignore_resize_confirmation = true
  }

  depends_on = [
    var.project_id,
    var.user_id
  ]
}

