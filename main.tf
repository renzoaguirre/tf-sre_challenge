locals {
  Owner = "Renzo"
  
  azr_tags = {
    Owner = local.Owner
  }
}

data "external" "my_p_ip" {
    program = ["bash", "${path.module}/external/getmyip.sh"]
}

output "my_ip" {
value = "${data.external.my_p_ip.result.ip}"
}

module "networking_module" {
    source = "./modules/networking"
    resource_group_name = var.resource_group_name
    location = var.location
    virtual_network_name = "vnet-dv-app-01"
    virtual_network_address_space = "10.0.0.0/16"
    tags = local.azr_tags
}

module "keyvault_module" {
    source = "./modules/keyvault"
    keyvault_name = "kv-dv-app-01"
    location = var.location
    resource_group_name = var.resource_group_name
    vnet_subnetid = [module.networking_module.subnetid]
    public_ip = ["${data.external.my_p_ip.result.ip}"]
    depends_on = [ module.networking_module ]
    tags = local.azr_tags
}

module "storage_module" {
    source = "./modules/storage"
    storage_account_name = "stadv01"
    storage_container_name = "sta-container-dv-01"
    location = var.location
    resource_group_name = var.resource_group_name
    vnet_subnetid = [module.networking_module.subnetid]
    public_ip = ["${data.external.my_p_ip.result.ip}"]
    depends_on = [ module.networking_module ]
    tags = local.azr_tags
}