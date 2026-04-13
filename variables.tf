# OCI Auth
variable "tenancy_ocid" {
  description = "OCID of the OCI tenancy"
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaapz275djumonwyh4tza5ewjm4dbup3rcos27h5gnwdofm4i5ge5ja"
}

variable "user_ocid" {
  description = "OCID of the OCI user"
  type        = string
  default     = "ocid1.user.oc1..aaaaaaaa3nscnrbs2clm5y4ot7mwcspizuycxy6cqbv2mf32ldswmq3p2whq"
}

variable "fingerprint" {
  description = "Fingerprint of the OCI API key"
  type        = string
  default     = "19:48:b9:94:aa:f9:b7:c0:c9:03:76:85:ce:79:d8:cd"
}

variable "private_key_path" {
  description = "Path to the OCI API private key file"
  type        = string
  default     = "~/.oci/enav-oci.pem"
}

variable "region" {
  description = "OCI region (e.g. us-ashburn-1)"
  type        = string
  default     = "il-jerusalem-1"
}

variable "compartment_id" {
  description = "OCID of the compartment to create resources in"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaaided5ezscmp764ox4wa5rjth3ca6rhzuznk5r7fqdd3rysalig3q"
}

# VCN
variable "vcn_name" {
  description = "Display name for the VCN"
  type        = string
  default     = "oke-vcn"
}

variable "vcn_cidr" {
  description = "CIDR block for the VCN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  description = "DNS label for the VCN (alphanumeric, max 15 chars)"
  type        = string
  default     = "okevcn"
}

# Subnets
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet (load balancers)"
  type        = string
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet (worker nodes)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_dns_label" {
  description = "DNS label for the public subnet"
  type        = string
  default     = "pub"
}

variable "private_subnet_dns_label" {
  description = "DNS label for the private subnet"
  type        = string
  default     = "priv"
}

# OKE Cluster
variable "cluster_name" {
  description = "Display name for the OKE cluster"
  type        = string
  default     = "oke-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the OKE cluster (e.g. v1.29.1)"
  type        = string
  default     = "v1.32.1"
}

# Node Pool
variable "node_pool_name" {
  description = "Display name for the node pool"
  type        = string
  default     = "oke-node-pool"
}

variable "node_shape" {
  description = "Compute shape for worker nodes"
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "node_ocpus" {
  description = "Number of OCPUs per worker node (Flex shapes)"
  type        = number
  default     = 2
}

variable "node_memory_gbs" {
  description = "Memory in GBs per worker node (Flex shapes)"
  type        = number
  default     = 16
}

variable "node_image_id" {
  description = "OCID of the OS image for worker nodes (OKE-optimized image recommended)"
  type        = string
  default     = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaa7ltt6r5gvrsq43j4t3u27b4fyjpdxwdktosrnyaodhpm2dx44aqq"
}

variable "node_count" {
  description = "Number of worker nodes in the node pool"
  type        = number
  default     = 3
}

variable "ssh_public_key" {
  description = "SSH public key to install on worker nodes"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDn6x5VPJ3FBw3VK8skV7jFBT/dUvTut27DiD/2KeCDH1v0EWVqnVPutVE7bNdm6X+fAk3Ye8JlMdkfGs7RAO74/zHQVlEmz7BQnquaoNmmAOHvrqFE68KIKF7QUVWWYQcf7KEQsLz3bQOY59SS3W0haMGrmLFgYj2am7Bjjrr2nQ5cHXWyStTazWh4QVFzjsqMB3yq7cV/xSRfoA/44N2FwOLrdVESV6UnotBxfs8xUFeddu6ucffqsw1BetxfkmHsKF/z9/kx6CLAxDtvJW6mNO1Q8GezkBLETixlFfz4u795bKQFyQ7PnZbxUOudyGhvVGXM2F57kjqKa5fIoyPaWLowK23x0MNTsIriVfJ12WBBREMykO72J9J+uZ1828HCe8PgJqPnfd/rZA/seuKWZEt4LjBDHd5/8u2qTKAeAv/kKDqmwu13XTEGDuVojEgJLFvxtlMKVaZ2PtbEbGHqIcRECaux4iXzOfDEvIc0lX2HR0SsjlGl88utTdx+wpF8zR2cNcPBlPjty1H0Zmu/hQDYwLkSDCb7MOKCYXz2n+2iY11l97QPgvx3UVN3NwNJIZuH+Jm8ZI9qGEHmvjZqHG0ZFEa9w27y0jkNiaJv1DUU34KoOkJwWvnG6IzpwhAbc6yOUVZoTSdIQiiZ3yKxaXv5qi9dDrwwEpIAhwYz1Q== root"
}

# Tags
variable "tags" {
  description = "Free-form tags to apply to all resources"
  type        = map(string)
  default     = {}
}
