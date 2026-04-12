variable "compartment_id" {
  description = "OCID of the compartment"
  type        = string
}

variable "vcn_id" {
  description = "OCID of the VCN"
  type        = string
}

variable "internet_gateway_id" {
  description = "OCID of the Internet Gateway"
  type        = string
}

variable "nat_gateway_id" {
  description = "OCID of the NAT Gateway"
  type        = string
}

variable "service_gateway_id" {
  description = "OCID of the Service Gateway"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "public_subnet_dns_label" {
  description = "DNS label for the public subnet"
  type        = string
}

variable "private_subnet_dns_label" {
  description = "DNS label for the private subnet"
  type        = string
}

variable "tags" {
  description = "Free-form tags"
  type        = map(string)
  default     = {}
}
