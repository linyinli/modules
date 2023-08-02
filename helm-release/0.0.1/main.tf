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

# @group "Basic"
# @label "Release Name"
variable "release_name" {
  type = string
  description = "The name of the Helm release"
}

# @group "Basic"
# @label "Release Namespace"
variable "release_namespace" {
  type = string
  description = "The namespace of the Helm release"
  default     = "default"
}

# @group "Basic"
# @label "Chart Repository"
variable "chart_repository" {
  type = string
  description = "The URL of the Helm chart repository, such as https://charts.bitnami.com/bitnami or oci://registry-1.docker.io/bitnamicharts"
}

# @group "Basic"
# @label "Chart Name"
variable "chart_name" {
  type = string
  description = "The name of the Helm chart, such as nginx"
}

# @group "Basic"
# @label "Chart Version"
variable "chart_version" {
  type = string
  description = "The version of the Helm chart"
  default     = ""
}

# @group "Basic"
# @label "Set Values"
variable "set_values" {
  description = "Value block with custom values to be merged with the values yaml, a yaml formatted text"
  default     = {}
}

# @group "Advanced"
# @label "Force Update"
variable "force_update" {
  description = "Force resource update through delete/recreate if needed"
  default     = false
}

# @group "Advanced"
# @label "Timeout"
variable "timeout" {
  type = number
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
