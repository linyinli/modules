resource "alicloud_ons_instance" "example" {
    instance_name   = var.instance_name
    remark = "default_ons_instance_remark"
}

# @label "实例名"
variable "instance_name" {
    description = "The ID of the image used to launch the ECS instance"
    default = "onsInstanceName"
}
