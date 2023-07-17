output "service_port" {
  value = var.service_port
}

output "endpoint_webservice" {
  value = "http://${alicloud_instance.example.public_ip}:${var.service_port}"
}

output "dependsOn" {
  value = var.dependsOn
  description = "Service dependsOn"
}
