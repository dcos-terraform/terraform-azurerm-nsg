variable "subnet_range" {
}

variable "location" {
}

variable "cluster_name" {
}

variable "name_prefix" {
}

variable "tags" {
  type    = map(string)
  default = {}
}

provider "azurerm" {
  version = "=2.14.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.name_prefix != "" ? "${var.name_prefix}-${var.cluster_name}" : var.cluster_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.cluster_name}"
  address_space       = [var.subnet_range]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = merge(
    var.tags,
    {
      "Name"    = var.cluster_name
      "Cluster" = var.cluster_name
    },
  )
}

resource "azurerm_subnet" "subnet" {
  name                 = "dcos-${var.cluster_name}"
  address_prefixes     = [var.subnet_range]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}

module "nsg" {
  source = "../../"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_range        = var.subnet_range
  admin_ips           = ["0.0.0.0/0"]
  cluster_name        = var.cluster_name

  num_masters        = 1
  num_private_agents = 1
  num_public_agents  = 1
  num_bootstrap      = 1
}
