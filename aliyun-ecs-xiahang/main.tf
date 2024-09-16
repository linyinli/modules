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
  resource_group_id = alicloud_resource_group.example.id
}

resource "alicloud_vswitch" "example" {
  name              = "example-vswitch"
  cidr_block        = "10.0.0.0/24"
  vpc_id            = alicloud_vpc.example.id
  availability_zone = "cn-hangzhou-b"
}

resource "alicloud_instance" "example" {
  instance_name             = "example-instance"
  image_id                  = "your_image_id"
  instance_type             = "ecs.n1.small"
  security_group_ids        = [alicloud_security_group.example.id]
  vswitch_id                = alicloud_vswitch.example.id
  internet_charge_type      = "PayByTraffic"
  internet_max_bandwidth_out = 5
}

resource "alicloud_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"

  ingress {
    action     = "accept"
    protocol   = "tcp"
    cidr_ip    = "0.0.0.0/0"
    port_range = "22/22"
  }

  egress {
    action     = "accept"
    protocol   = "tcp"
    cidr_ip    = "0.0.0.0/0"
    port_range = "0/0"
  }
}
