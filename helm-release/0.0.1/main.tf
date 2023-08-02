terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source = "hashicorp/helm"
    }
  }
}

resource "helm_release" "release" {
  name       = var.release_name
  namespace  = var.release_namespace
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version

  create_namespace = true
  force_update     = var.force_update
  timeout          = var.timeout
  wait             = false
  max_history      = 10
}

data "helm_template" "release" {
  name       = var.release_name
  namespace  = var.release_namespace
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version
}

variable "release_name" {
  description = "The name of the Helm release"
}

variable "release_namespace" {
  description = "The namespace of the Helm release"
  default     = "default"
}

variable "chart_repository" {
  description = "The URL of the Helm chart repository, such as https://charts.bitnami.com/bitnami or oci://registry-1.docker.io/bitnamicharts"
}

variable "chart_name" {
  description = "The name of the Helm chart, such as nginx"
}

variable "chart_version" {
  description = "The version of the Helm chart"
  default     = ""
}

variable "set_values" {
  description = "Value block with custom values to be merged with the values yaml, a yaml formatted text"
  default     = {}
}

variable "force_update" {
  description = "Force resource update through delete/recreate if needed"
  default     = false
}

variable "timeout" {
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks)"
  default     = 300
}

output "release_metadata" {
  value = resource.helm_release.release.metadata
}

output "release_manifest" {
  value = data.helm_template.release.manifest
}

output "release_notes" {
  value = data.helm_template.release.notes
}