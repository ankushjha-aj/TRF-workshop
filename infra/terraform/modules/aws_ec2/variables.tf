variable "aws_instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = ""
}

variable "aws_ami" {
  description = "EC2 AMI id"
  type        = string
  default     = ""
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


# variable "public_subnet_id" {
#   type        = map(string)
#   description = "Map of subnet IDs"
#   default     = {}
# }