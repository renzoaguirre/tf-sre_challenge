#output "resource_group_name" {
#    value=azurerm_resource_group.appgrp.name  
#}

#output "location" {
#    value=azurerm_virtual_network.appnetwork.location
#}

output "subnetid" {
    value=azurerm_subnet.subnet-dv.id
}

#output "subnet" {
#    value=azurerm_subnet.subnet-dv
#}

#output "resource_group" {
#    value=azurerm_resource_group.appgrp
#}
