# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.99.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "myterraformgroup" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "networkwin" {
    source = "./modules/networkwin"
    count  = var.create_windows_resources ? 1 : 0
    resource_group_name = var.resource_group_name          
    resource_group_location = var.resource_group_location 
    vnet_name = var.vnet_name 
    pip_name = var.pip_name
    subnet_name = var.subnet_name
    networksecuritygroup_name = var.networksecuritygroup_name
    netinterface_name = var.netinterface_name
    depends_on = [azurerm_resource_group.myterraformgroup] 
}

module "networklinux" {
  source = "./modules/networklinux"
  count  = var.create_linux_resources ? 1 : 0
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  depends_on = [azurerm_resource_group.myterraformgroup]
}
 

module "vmwin" {
    source = "./modules/vmwin"
    count  = var.create_windows_resources ? 1 : 0
    resource_group_name = var.resource_group_name          
    resource_group_location = var.resource_group_location  
    vm_name = var.vm_name
    vm_size = var.vm_size
    vm_username = var.vm_username
    vm_password = var.vm_password
    os_disk_storage_account_type = var.os_disk_storage_account_type
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    image_version = var.image_version
    network_interface_id = module.networkwin[0].network_interface_id
    depends_on = [module.networkwin] 
}

module "vmlinux" {
    source = "./modules/vmlinux"
    count  = var.create_linux_resources ? 1 : 0
    resource_group_name = var.resource_group_name          
    resource_group_location = var.resource_group_location  
    vm_username_linux = var.vm_name_linux
    vm_size_linux = var.vm_size_linux
    network_interface_id = module.networklinux[count.index].network_interface_id
    depends_on = [module.networklinux] 
}


