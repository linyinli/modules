resource "alicloud_ons_instance" "example" {
    name   = var.name
    remark = "default_ons_instance_remark"
}

# @label "实例名"
variable "name" {
    description = "The ID of the image used to launch the ECS instance"
    default = "onsInstanceName"
}