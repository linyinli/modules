
# Module `alicloud-alikafka`

Provider Requirements:
* **alicloud:** (any version)

## Input Variables
* `instance_name` (default `"alikafkaInstanceName"`): The instance name of the AliKafka instance

## Output Values
* `end_point`

## Managed Resources
* `alicloud_alikafka_instance.example` from `alicloud`

## Data Resources
* `data.alicloud_security_groups.default` from `alicloud`
* `data.alicloud_vpcs.default` from `alicloud`
* `data.alicloud_vswitches.default` from `alicloud`

