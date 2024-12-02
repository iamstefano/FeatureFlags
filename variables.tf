variable "resource_group_name"{
    default = "sa-TerraformGroup-rg"
    description = "Nome gruppo risorse"
}

variable "resource_group_location" {
    default = "northeurope"
    description = "Locazione del gruppo di risorse"
}

variable "create_linux_resources" {
  description = "Flag per creare risorse Linux"
  type        = bool
  default     = true
}

variable "create_windows_resources" {
  description = "Flag per creare risorse Windows"
  type        = bool
  default     = true
}

/*NETWORKwin*/

variable "vnet_name" {
    default = "saVnet"
    description = "Nome Vnet"

}

variable "pip_name" {
    default = "saPublicIp01"
    description = "Indirizzo IP pubblico"
}

variable "subnet_name" {
  default = "saSubnet"
  description = "Nome subnet"
}

variable "networksecuritygroup_name" {
  default = "saNetSecGroup"
  description = "Nome gruppo sicurezza network"
}

variable "netinterface_name" {
  default = "saNetInterface"
  description = "Nome interfaccia network"
}

/*NETWORKlinux*/

variable "vnet_name_linux" {
    default = "saVnetLinux"
    description = "Nome Vnet"

}

variable "subnet_name_linux" {
  default = "saSubnetLinux"
  description = "Nome subnet"
}


/*VMwin*/

variable "vm_name" {
  default = "saVM"
  description = "Nome VM"
}

variable "vm_size" {
  default = "Standard_B2ms"
  description = "Modello size della VM"
}

variable "vm_username" {
  default = "stefanostefano"
  description = "Username VM"
}

variable "vm_password" {
  default = "StefanoAre140488_"
  description = "Password VM"
}

variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
  description = "Tipo storage disk VM"
}

variable "image_publisher" {
  default = "MicrosoftWindowsServer"
  description = "Publisher immagine"
}
variable "image_offer" {
  default = "WindowsServer"
  description = "Tipo di immagine"
}
variable "image_sku" {
  default = "2016-Datacenter"
  description = "Sku immagine"
}
variable "image_version" {
  default = "latest"
  description = "Versione immagine"
}


/*VMlinux*/

variable "vm_name_linux" {
  default = "saVMLinux"
  description = "Nome VM"
}

variable "vm_size_linux" {
  default = "Standard_B2ms"
  description = "Modello size della VM"
}

variable "vm_username_linux" {
  default = "stefanostefano"
  description = "Username VM Linux"
}

