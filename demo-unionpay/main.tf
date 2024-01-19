provider "alicloud" {
  access_key = "your_access_key"
  secret_key = "your_secret_key"
  region     = "your_region"
}

resource "alicloud_resource_group" "example" {
  name = "example_resource_group"
}

resource "alicloud_vpc" "example" {
  name       = "example_vpc"
  cidr_block = "10.0.0.0/16"
}

resource "alicloud_vswitch" "example" {
  name            = "example_vswitch"
  cidr_block      = "10.0.0.0/24"
  availability_zone = "your_availability_zone"
  vpc_id          = alicloud_vpc.example.id
}

resource "alicloud_instance" "example" {
  instance_name              = "example_instance"
  image_id                   = "your_image_id"
  instance_type              = "your_instance_type"
  security_group_ids         = [alicloud_security_group.example.id]
  vswitch_id                 = alicloud_vswitch.example.id
  internet_max_bandwidth_out = 10
}

resource "alicloud_security_group" "example" {
  name        = "example_security_group"
  description = "example security group"
  vpc_id      = alicloud_vpc.example.id
}
