resource "oci_core_vcn" "this" {
  compartment_id = var.compartment_id
  display_name   = var.vcn_name
  cidr_blocks    = [var.vcn_cidr]
  dns_label      = var.dns_label
  freeform_tags  = var.tags
}

resource "oci_core_internet_gateway" "this" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = "${var.vcn_name}-igw"
  enabled        = true
  freeform_tags  = var.tags
}

resource "oci_core_nat_gateway" "this" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = "${var.vcn_name}-nat"
  freeform_tags  = var.tags
}

resource "oci_core_service_gateway" "this" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = "${var.vcn_name}-sgw"
  freeform_tags  = var.tags

  services {
    service_id = data.oci_core_services.all_services.services[0].id
  }
}

data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}
