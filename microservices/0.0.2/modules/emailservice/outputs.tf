output "service_ip" {
  description = "Service IP"
  value       = data.kubernetes_service.emailservice.spec.0.cluster_ip
}
