variable "metal_project_name" {
  description = "Equinix Metal Project Name."
  type        = string
}

variable "metro" {
  description = "Location code."
  type        = string
  default     = "da"
}


variable "plan" {
  description = "Server config."
  type        = string
  default     = "c3.small.x86"
}