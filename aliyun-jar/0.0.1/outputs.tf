output "public_ip" {
  value = alicloud_instance.example.public_ip
}

output "primary_ip_address" {
  value = alicloud_instance.example.primary_ip_address
}

output "service_port" {
  value = var.service_port
}

output "endpoint_webservice" {
  value = "http://${alicloud_instance.example.public_ip}:${var.service_port}"
}

output "env" {
  value = var.env
  description = "Service environment"
}
