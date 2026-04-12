variable "compartment_id" {
  description = "OCID of the compartment"
  type        = string
}

variable "vcn_name" {
  description = "Display name for the VCN"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR block for the VCN"
  type        = string
}

variable "dns_label" {
  description = "DNS label for the VCN"
  type        = string
}

variable "tags" {
  description = "Free-form tags"
  type        = map(string)
  default     = {}
}
