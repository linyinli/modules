output "frontend_external_endpoint" {
    description = "Online Boutique frontend access URL" 
    value       = "http://${data.kubernetes_service.frontend_service.status.load_balancer.0.ingress.0.hostname}:${data.kubernetes_service.frontend_service.metadata.port.0.node_port}"
}
