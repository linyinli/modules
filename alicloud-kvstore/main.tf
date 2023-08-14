resource "alicloud_kvstore_instance" "example" {
  db_instance_name = "demo-redis"
  vswitch_id       = data.alicloud_vswitches.default.vswitches.0.id
  security_ips     = var.security_ips
  instance_type    = var.instance_type
  engine_version   = var.engine_version
  config = {
    appendonly             = "yes",
    lazyfree-lazy-eviction = "yes",
  }
  zone_id           = "cn-shenzhen-f"
  instance_class    = var.instance_class
}

data "alicloud_vpcs" "default" {
  name_regex = "default"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.vpcs.0.id
}

# @label "实例类型"
variable "instance_type" {
    description = "The instance type of the KVStore instance"
    default     = "Redis"
}

# @label "实例版本"
variable "engine_version" {
    description = "The engine version of the KVStore instance"
    default     = "5.0"
}

# @label "实例规格"
# @group "基础"
variable "instance_class" {
    description = "The instance class of the KVStore instance"
    default     = "redis.master.small.default"
}

# @label "IP白名单"
# @group "基础"
variable "security_ips" {
    type        = list(string)
    description = "The security IPs of the KVStore instance"
    default     = ["0.0.0.0"]
}

output "connection_domain" {
  value = alicloud_kvstore_instance.example.connection_domain
}
