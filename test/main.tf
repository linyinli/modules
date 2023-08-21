provider "alicloud" {
  access_key = "your_access_key"
  secret_key = "your_secret_key"
  region     = "your_region"
}

resource "alicloud_resource_group" "example" {
  name = "example-resource-group"
}

resource "alicloud_vpc" "example" {
  name       = "example-vpc"
  cidr_block = "10.0.0.0/16"
  vswitch_ids = [alicloud_vswitch.example.id]
}

resource "alicloud_vswitch" "example" {
  name            = "example-vswitch"
  cidr_block      = "10.0.0.0/24"
  availability_zone = "your_availability_zone"
  vpc_id          = alicloud_vpc.example.id
}

resource "alicloud_instance" "example" {
  instance_name = "example-instance"
  image_id      = "your_image_id"
  instance_type = "your_instance_type"
  vswitch_id    = alicloud_vswitch.example.id
  security_groups = ["your_security_group_id"]
}