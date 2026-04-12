output "cluster_id" {
  description = "OCID of the OKE cluster"
  value       = oci_containerengine_cluster.this.id
}

output "cluster_endpoints" {
  description = "Kubernetes API server endpoints"
  value       = oci_containerengine_cluster.this.endpoints
}

output "node_pool_id" {
  description = "OCID of the node pool"
  value       = oci_containerengine_node_pool.this.id
}

output "kubernetes_version" {
  description = "Kubernetes version in use"
  value       = oci_containerengine_cluster.this.kubernetes_version
}
