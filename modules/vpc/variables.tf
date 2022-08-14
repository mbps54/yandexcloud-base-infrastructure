variable "project" {
  description = "project"
  type        = string
}

variable "public_cidr" {
  description = "public_cidr"
  type        = list(any)
}

variable "private_cidr" {
  description = "private_cidr"
  type        = list(any)
}

variable "availability_zones" {
  description = "availability_zones"
  type        = list(any)
}
