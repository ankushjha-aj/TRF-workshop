variable "org_name" {
  type = string
}

variable "app_name" {
  type = string
}

variable "env" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_conf" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "private_subnet_conf" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "domain_name" {
  type = string
}

variable "domain_name_servers" {
  type = list(string)
}
