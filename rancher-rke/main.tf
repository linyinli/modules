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
    ssh_key = var.ssh_key
  }
  ignore_docker_version = true
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

# @label "SSH秘钥"
variable "ssh_key" {
    description = "The ssh key of the user"
}
