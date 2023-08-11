terraform {
  required_providers {
    rke = {
      source = "rancher/rke"
    }
  }
}

resource "rke_cluster" "cluster" {
  nodes {
    address = var.node_ip
    role    = var.node_role
    user    = var.ssh_user
    port    = var.ssh_port
    ssh_key = var.ssh_key
  }
  ignore_docker_version = true
  kubernetes_version = var.kubernetes_version
  upgrade_strategy {
    drain = true
    max_unavailable_worker = "20%"
  }
}

# @label "节点IP"
variable "node_ip" {
    description = "The node IP of the rke cluster"
    default     = "1.2.3.4"
}

# @label "节点角色"
variable "node_role" {
    type        = list(string)
    description = "The cluster role of the node"
    default     = ["controlplane", "worker", "etcd"]
}

# @label "SSH用户"
variable "ssh_user" {
    description = "The user of the node"
    default     = "ubuntu"
}

# @label "SSH端口"
variable "ssh_port" {
    description = "The ssh port of the node"
    default     = 22
}

# @label "SSH秘钥"
variable "ssh_key" {
    description = "The ssh key of the user"
}

# @label "Kubernetes版本"
variable "kubernetes_version" {
    description = "The kubernetes version of the rke cluster"
    default = "v1.23.15-rancher1-1"
}

output "kube_config_yaml" {
  sensitive = true
  value = rke_cluster.cluster.kube_config_yaml
}

output "rke_cluster_yaml" {
  sensitive = true
  value = rke_cluster.cluster.rke_cluster_yaml
}

output "api_server_url" {
  value = rke_cluster.cluster.api_server_url
}

output "control_plane_hosts" {
  value = rke_cluster.cluster.control_plane_hosts
}

output "etcd_hosts" {
  value = rke_cluster.cluster.etcd_hosts
}

output "worker_hosts" {
  value = rke_cluster.cluster.worker_hosts
}

output "cluster_cidr" {
  value = rke_cluster.cluster.cluster_cidr
}

output "running_system_images" {
  value = rke_cluster.cluster.running_system_images
}
