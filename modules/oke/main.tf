resource "oci_containerengine_cluster" "this" {
  compartment_id     = var.compartment_id
  vcn_id             = var.vcn_id
  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version
  type               = "ENHANCED_CLUSTER"
  freeform_tags      = var.tags

  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = var.public_subnet_id
  }

  options {
    service_lb_subnet_ids = [var.public_subnet_id]

    add_ons {
      is_kubernetes_dashboard_enabled = false
      is_tiller_enabled               = false
    }

    admission_controller_options {
      is_pod_security_policy_enabled = false
    }

    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
  }
}

resource "oci_containerengine_node_pool" "this" {
  compartment_id     = var.compartment_id
  cluster_id         = oci_containerengine_cluster.this.id
  name               = var.node_pool_name
  kubernetes_version = var.kubernetes_version
  freeform_tags      = var.tags

  node_shape = var.node_shape

  node_shape_config {
    ocpus         = var.node_ocpus
    memory_in_gbs = var.node_memory_gbs
  }

  node_source_details {
    source_type             = "IMAGE"
    image_id                = var.node_image_id
    boot_volume_size_in_gbs = 50
  }

  node_config_details {
    size          = var.node_count
    freeform_tags = var.tags

    dynamic "placement_configs" {
      for_each = try(data.oci_identity_availability_domains.ads.availability_domains, [])
      content {
        availability_domain = placement_configs.value.name
        subnet_id           = var.private_subnet_id
      }
    }
  }

  ssh_public_key = var.ssh_public_key
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}
