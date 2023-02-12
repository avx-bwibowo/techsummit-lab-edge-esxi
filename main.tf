module "esxi-01" {
  source  = "bayupw/metal-vmware-esxi/equinix"
  version = "1.0.0"

  metal_project_name   = var.metal_project_name
  metro                = var.metro
  plan                 = var.plan
  esx_hostname         = "esxi-01"
  create_metal_gateway = true
  create_user_ssh_key  = false
}

module "esxi-02" {
  source  = "bayupw/metal-vmware-esxi/equinix"
  version = "1.0.0"

  metal_project_name   = var.metal_project_name
  metro                = var.metro
  plan                 = var.plan
  esx_hostname         = "esxi-02"
  create_metal_gateway = false
  create_user_ssh_key  = false
}

output "esxi-01-ip" {
  description = "VMware ESXi Public IP."
  value       = module.esxi-01.equinix_metal_device.access_public_ipv4
}

output "esxi-01-password" {
  description = "VMware ESXi password."
  value       = module.esxi-01.equinix_metal_device.root_password
  sensitive   = true
}

output "esxi-02-ip" {
  description = "VMware ESXi Public IP."
  value       = module.esxi-01.equinix_metal_device.access_public_ipv4
}

output "esxi-02-password" {
  description = "VMware ESXi password."
  value       = module.esxi-01.equinix_metal_device.root_password
  sensitive   = true
}

output "metal_gateway_ip" {
  description = "Metal Gateway IP."
  value       = cidrhost(module.esxi-01.equinix_metal_reserved_ip_block[0].cidr_notation, 1)
}

output "public_ip_block" {
  description = "Public IP CIDR block"
  value       = module.esxi-01.equinix_metal_reserved_ip_block[0].cidr_notation
}

output "usable_public_ip" {
  description = "Usable public IP range"
  value       = "${cidrhost(module.esxi-01.equinix_metal_reserved_ip_block[0].cidr_notation, 2)} - ${cidrhost(module.esxi-01.equinix_metal_reserved_ip_block[0].cidr_notation, module.esxi-01.equinix_metal_reserved_ip_block[0].quantity - 2)}"
}