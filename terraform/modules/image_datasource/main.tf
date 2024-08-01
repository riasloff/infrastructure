
data "openstack_images_image_v2" "image_1" {
  name        = var.image_name
  most_recent = true

  properties = {
    key = "value"
  }
}