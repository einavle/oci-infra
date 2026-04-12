output "vcn_id" {
  description = "OCID of the VCN"
  value       = oci_core_vcn.this.id
}

output "internet_gateway_id" {
  description = "OCID of the Internet Gateway"
  value       = oci_core_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "OCID of the NAT Gateway"
  value       = oci_core_nat_gateway.this.id
}

output "service_gateway_id" {
  description = "OCID of the Service Gateway"
  value       = oci_core_service_gateway.this.id
}
