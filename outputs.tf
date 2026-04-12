output "vcn_id" {
  description = "OCID of the VCN"
  value       = module.vcn.vcn_id
}

output "public_subnet_id" {
  description = "OCID of the public subnet"
  value       = module.subnets.public_subnet_id
}

output "private_subnet_id" {
  description = "OCID of the private subnet"
  value       = module.subnets.private_subnet_id
}

output "cluster_id" {
  description = "OCID of the OKE cluster"
  value       = module.oke.cluster_id
}

output "cluster_endpoints" {
  description = "Kubernetes API server endpoints"
  value       = module.oke.cluster_endpoints
}

output "node_pool_id" {
  description = "OCID of the OKE node pool"
  value       = module.oke.node_pool_id
}

output "kubeconfig_command" {
  description = "OCI CLI command to generate kubeconfig"
  value       = "oci ce cluster create-kubeconfig --cluster-id ${module.oke.cluster_id} --region ${var.region} --token-version 2.0.0 --kube-endpoint PUBLIC_ENDPOINT"
}
