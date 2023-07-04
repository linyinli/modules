resource "helm_release" "elk_stack" {
  name       = "elk-stack"
  repository = "https://helm.elastic.co"
  chart      = "elastic-stack"
  version    = "7.14.0"

  set {
    name  = "elasticsearch.enabled"
    value = "true"
  }

  set {
    name  = "kibana.enabled"
    value = "true"
  }

  set {
    name  = "logstash.enabled"
    value = "true"
  }
}