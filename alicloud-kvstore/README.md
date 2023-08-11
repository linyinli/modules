
# Module `alicloud-kvstore`

Provider Requirements:
* **alicloud:** (any version)

## Input Variables
* `engine_version` (default `"5.0"`): The engine version of the KVStore instance
* `instance_class` (default `"redis.master.small.default"`): The instance class of the KVStore instance
* `instance_type` (default `"Redis"`): The instance type of the KVStore instance
* `security_ips` (default `["0.0.0.0"]`): The security IPs of the KVStore instance

## Managed Resources
* `alicloud_kvstore_instance.example` from `alicloud`

## Data Resources
* `data.alicloud_vpcs.default` from `alicloud`
* `data.alicloud_vswitches.default` from `alicloud`

