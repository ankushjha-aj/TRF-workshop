variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for vpc"
}

variable "org_name" {
  type        = string
  description = "organisation name"
  default     = ""
}

variable "app_name" {
  type        = string
  description = "application name"
  default     = ""
}

variable "env" {
  type        = string
  description = "Environment Name"
  default     = ""
}

variable "domain_name" {
  description = "Domain name for DHCP options"
  type        = string
  default     = ""
}

variable "domain_name_servers" {
  description = "List of domain name servers"
  type        = list(string)
  default     = [""]
}