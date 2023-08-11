
# Module `rancher-rke`

Provider Requirements:
* **rke:** (any version)

## Input Variables
* `node_ip` (default `"1.2.3.4"`): The node IP of the rke cluster
* `node_role` (default `["controlplane","worker","etcd"]`): The cluster role of the node
* `ssh_key` (default `"-----BEGIN RSA PRIVATE KEY-----\n\n-----END RSA PRIVATE KEY-----\n"`): The ssh key of the user
* `ssh_user` (default `"ubuntu"`): The user of the node

## Managed Resources
* `rke_cluster.cluster` from `rke`

