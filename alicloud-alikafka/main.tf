resource "alicloud_alikafka_instance" "example" {
  name           = var.instance_name
  partition_num  = 50
  disk_type      = 1
  disk_size      = 500
  deploy_type    = 5
  io_max         = 20
  vswitch_id     = data.alicloud_vswitches.default.vswitches.0.id
  security_group = data.alicloud_security_groups.default.groups.0.id
}

data "alicloud_vpcs" "default" {
  name_regex = "default"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.vpcs.0.id
}

data "alicloud_security_groups" "default" {
  name_regex = "default"
}

# @label "实例名"
variable "instance_name" {
  description = "The instance name of the AliKafka instance"
  default = "alikafkaInstanceName"
}

output "end_point" {
  value = alicloud_alikafka_instance.example.end_point
}