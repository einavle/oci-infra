output "public_subnet_id" {
  description = "OCID of the public subnet"
  value       = oci_core_subnet.public.id
}

output "private_subnet_id" {
  description = "OCID of the private subnet"
  value       = oci_core_subnet.private.id
}

output "public_route_table_id" {
  description = "OCID of the public route table"
  value       = oci_core_route_table.public.id
}

output "private_route_table_id" {
  description = "OCID of the private route table"
  value       = oci_core_route_table.private.id
}
