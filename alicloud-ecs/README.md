
# Module `alicloud-ecs`

Provider Requirements:
* **alicloud:** (any version)

## Input Variables
* `image_id` (default `"ubuntu_18_04_x64_20G_alibase_20230208.vhd"`): The ID of the image used to launch the ECS instance
* `instance_type` (default `"ecs.s6-c1m2.small"`): The instance type of the ECS instance
* `internet_charge_type` (default `"PayByTraffic"`): The billing method of the public network bandwidth
* `internet_max_bandwidth_out` (default `5`): The maximum outbound bandwidth of the public network
* `system_disk_category` (default `"cloud_efficiency"`): The category of the system disk
* `system_disk_size` (default `40`): The size of the system disk

## Managed Resources
* `alicloud_instance.example` from `alicloud`

