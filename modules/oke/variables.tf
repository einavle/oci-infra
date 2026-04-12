variable "compartment_id" {
  description = "OCID of the compartment"
  type        = string
}

variable "vcn_id" {
  description = "OCID of the VCN"
  type        = string
}

variable "cluster_name" {
  description = "Display name for the OKE cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version (e.g. v1.29.1)"
  type        = string
}

variable "public_subnet_id" {
  description = "OCID of the public subnet (API endpoint + load balancers)"
  type        = string
}

variable "private_subnet_id" {
  description = "OCID of the private subnet (worker nodes)"
  type        = string
}

variable "node_pool_name" {
  description = "Display name for the node pool"
  type        = string
}

variable "node_shape" {
  description = "Compute shape for worker nodes"
  type        = string
}

variable "node_ocpus" {
  description = "Number of OCPUs per worker node"
  type        = number
}

variable "node_memory_gbs" {
  description = "Memory in GBs per worker node"
  type        = number
}

variable "node_image_id" {
  description = "OCID of the OS image for worker nodes"
  type        = string
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
}

variable "ssh_public_key" {
  description = "SSH public key for worker nodes"
  type        = string
}

variable "tags" {
  description = "Free-form tags"
  type        = map(string)
  default     = {}
}
