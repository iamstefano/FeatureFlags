variable "resource_group_name"{}
    
variable "resource_group_location" {}

variable "vm_username_linux" {}

variable "vm_size_linux" {}

variable "network_interface_id" {
  description = "ID dell'interfaccia di rete"
  type        = string
}
