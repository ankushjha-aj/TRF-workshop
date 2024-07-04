variable "vpc_id" {
  description = "The VPC ID to create in"
  type        = string
  default     = ""
}

variable "org_name" {
  type        = string
  description = "Organisation name"
  default     = ""
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}

variable "env" {
  type        = string
  description = "Environment Name"
  default     = ""
}