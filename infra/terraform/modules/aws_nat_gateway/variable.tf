variable "vpc_id" {
  description = "The ID of the VPC where the NAT gateway will be created."
  type        = string
  default     = ""
}

variable "public_subnet_id" {
  type        = map(string)
  description = "Map of subnet IDs"
  default     = {}
}

variable "org_name" {
  type        = string
  description = "Name of organisation name"
  default     = ""
}

variable "app_name" {
  type        = string
  description = "Name of app name"
  default     = ""
}

variable "env" {
  type        = string
  description = "Name of Environment "
  default     = ""
}