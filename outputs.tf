output "bootstrap_nsg_name" {
  description = "Network security group name of the bootstrap"
  value = element(
    concat(azurerm_network_security_group.bootstrap.*.name, [""]),
    0,
  )
}

output "bootstrap_nsg_id" {
  description = "Network security group id of the bootstrap"
  value = element(
    concat(azurerm_network_security_group.bootstrap.*.id, [""]),
    0,
  )
}

output "masters_nsg_name" {
  description = "Network security group name of the masters"
  value = element(
    concat(azurerm_network_security_group.masters.*.name, [""]),
    0,
  )
}

output "masters_nsg_id" {
  description = "Network security group id of the masters"
  value       = element(concat(azurerm_network_security_group.masters.*.id, [""]), 0)
}

output "private_agents_nsg_name" {
  description = "Network security group name of the private agents"
  value = element(
    concat(azurerm_network_security_group.private_agents.*.name, [""]),
    0,
  )
}

output "private_agents_nsg_id" {
  description = "Network security group id of the private agents"
  value = element(
    concat(azurerm_network_security_group.private_agents.*.id, [""]),
    0,
  )
}

output "public_agents_nsg_name" {
  description = "Network security group name of the public agents"
  value = element(
    concat(azurerm_network_security_group.public_agents.*.name, [""]),
    0,
  )
}

output "public_agents_nsg_id" {
  description = "Network security group id of the public agents"
  value = element(
    concat(azurerm_network_security_group.public_agents.*.id, [""]),
    0,
  )
}
