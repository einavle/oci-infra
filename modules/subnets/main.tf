# ── Route Tables ────────────────────────────────────────────────────────────────

resource "oci_core_route_table" "public" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "public-rt"
  freeform_tags  = var.tags

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = var.internet_gateway_id
  }
}

resource "oci_core_route_table" "private" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "private-rt"
  freeform_tags  = var.tags

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = var.nat_gateway_id
  }

  route_rules {
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = var.service_gateway_id
  }
}

# ── Security Lists ───────────────────────────────────────────────────────────────

resource "oci_core_security_list" "public" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "public-sl"
  freeform_tags  = var.tags

  # Allow all outbound
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
    stateless   = false
  }

  # Allow inbound HTTPS (load balancer traffic)
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "6" # TCP
    stateless = false
    tcp_options {
      min = 443
      max = 443
    }
  }

  # Allow inbound HTTP
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "6"
    stateless = false
    tcp_options {
      min = 80
      max = 80
    }
  }

  # Allow OKE control plane to reach load balancers
  ingress_security_rules {
    source    = var.private_subnet_cidr
    protocol  = "all"
    stateless = false
  }
}

resource "oci_core_security_list" "private" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "private-sl"
  freeform_tags  = var.tags

  # Allow all outbound
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
    stateless   = false
  }

  # Allow inbound from within VCN (node-to-node, control-plane-to-node)
  ingress_security_rules {
    source    = var.public_subnet_cidr
    protocol  = "all"
    stateless = false
  }

  ingress_security_rules {
    source    = var.private_subnet_cidr
    protocol  = "all"
    stateless = false
  }

  # Allow OKE control plane ICMP
  ingress_security_rules {
    source    = "0.0.0.0/0"
    protocol  = "1" # ICMP
    stateless = false
    icmp_options {
      type = 3
      code = 4
    }
  }

  # Allow SSH from public subnet for administration
  ingress_security_rules {
    source    = var.public_subnet_cidr
    protocol  = "6"
    stateless = false
    tcp_options {
      min = 22
      max = 22
    }
  }
}

# ── Subnets ──────────────────────────────────────────────────────────────────────

resource "oci_core_subnet" "public" {
  compartment_id             = var.compartment_id
  vcn_id                     = var.vcn_id
  display_name               = "public-subnet"
  cidr_block                 = var.public_subnet_cidr
  dns_label                  = var.public_subnet_dns_label
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_route_table.public.id
  security_list_ids          = [oci_core_security_list.public.id]
  freeform_tags              = var.tags
}

resource "oci_core_subnet" "private" {
  compartment_id             = var.compartment_id
  vcn_id                     = var.vcn_id
  display_name               = "private-subnet"
  cidr_block                 = var.private_subnet_cidr
  dns_label                  = var.private_subnet_dns_label
  prohibit_public_ip_on_vnic = true
  route_table_id             = oci_core_route_table.private.id
  security_list_ids          = [oci_core_security_list.private.id]
  freeform_tags              = var.tags
}
