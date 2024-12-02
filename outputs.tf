output "linux_vm_ip" {
  value       = var.create_linux_resources ? module.vmlinux[0].public_ip_address  : null
  description = "Indirizzo IP della macchina virtuale Linux"
}

output "windows_vm_ip" {
  value       = var.create_windows_resources ? module.vmwin[0].public_ip_address : null
  description = "Indirizzo IP della macchina virtuale Windows"
}

output "ssh_private_key" {
  value     = module.vmlinux[0].ssh_private_key
  sensitive = true
}

output "ssh_public_key" {
  value = module.vmlinux[0].ssh_public_key
}