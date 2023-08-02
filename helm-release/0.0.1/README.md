
# Module `helm-release`

Provider Requirements:
* **helm (`hashicorp/helm`):** (any version)
* **kubernetes (`hashicorp/kubernetes`):** (any version)

## Input Variables
* `chart_name` (required): The name of the Helm chart, such as nginx
* `chart_repository` (required): The URL of the Helm chart repository, such as https://charts.bitnami.com/bitnami or oci://registry-1.docker.io/bitnamicharts
* `chart_version` (default `""`): The version of the Helm chart
* `force_update` (default `false`): Force resource update through delete/recreate if needed
* `release_name` (required): The name of the Helm release
* `release_namespace` (default `"default"`): The namespace of the Helm release
* `set_values` (default `{}`): Value block with custom values to be merged with the values yaml, a yaml formatted text
* `timeout` (default `300`): Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks)

## Output Values
* `release_manifest`
* `release_metadata`
* `release_notes`

## Managed Resources
* `helm_release.release` from `helm`

## Data Resources
* `data.helm_template.release` from `helm`

