terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

resource "kubectl_manifest" "namespace" {
  yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: ${local.namespace}
YAML
}

data "kubectl_path_documents" "manifest" {
  pattern = "${path.module}/emailservice.yaml"
  vars = {
    namespace        = local.namespace 
    image_registry   = var.image_registry
    image_repository = var.image_repository
    image_version    = var.image_version
  }
}

resource "kubectl_manifest" "manifest" {
  wait_for_rollout = false
  depends_on = [kubectl_manifest.namespace]

  count     = length(data.kubectl_path_documents.manifest.documents)
  yaml_body = element(data.kubectl_path_documents.manifest.documents, count.index)
}

data "kubernetes_service" "emailservice" {
  depends_on = [kubectl_manifest.manifest]

  metadata {
    name      = local.emailservice_service_name
    namespace = local.namespace
  }
}

locals {
  emailservice_service_name = var.emailservice_service_name
  namespace                 = coalesce(var.namespace, "${var.seal_metadata_project_name}-${var.seal_metadata_application_name}")
}
