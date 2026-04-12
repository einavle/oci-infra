terraform {
  required_version = ">= 1.3.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "vcn" {
  source = "./modules/vcn"

  compartment_id = var.compartment_id
  vcn_name       = var.vcn_name
  vcn_cidr       = var.vcn_cidr
  dns_label      = var.vcn_dns_label
  tags           = var.tags
}

module "subnets" {
  source = "./modules/subnets"

  compartment_id             = var.compartment_id
  vcn_id                     = module.vcn.vcn_id
  internet_gateway_id        = module.vcn.internet_gateway_id
  nat_gateway_id             = module.vcn.nat_gateway_id
  service_gateway_id         = module.vcn.service_gateway_id
  public_subnet_cidr         = var.public_subnet_cidr
  private_subnet_cidr        = var.private_subnet_cidr
  public_subnet_dns_label    = var.public_subnet_dns_label
  private_subnet_dns_label   = var.private_subnet_dns_label
  tags                       = var.tags
}

module "oke" {
  source = "./modules/oke"

  compartment_id        = var.compartment_id
  vcn_id                = module.vcn.vcn_id
  cluster_name          = var.cluster_name
  kubernetes_version    = var.kubernetes_version
  public_subnet_id      = module.subnets.public_subnet_id
  private_subnet_id     = module.subnets.private_subnet_id
  node_pool_name        = var.node_pool_name
  node_shape            = var.node_shape
  node_ocpus            = var.node_ocpus
  node_memory_gbs       = var.node_memory_gbs
  node_image_id         = var.node_image_id
  node_count            = var.node_count
  ssh_public_key        = var.ssh_public_key
  tags                  = var.tags
}
