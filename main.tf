/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-nsg/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-nsg/job/master/)
 * # azurerm nsg
 * The module creates DC/OS Network Security Groups per DC/OS role on AzureRM.
 *
 * ## EXAMPLE
 *
 * ```hcl
 * module "dcos-security-groups" {
 *   source  = "dcos-terraform/nsg/azurerm"
 *   version = "~> 0.1"
 *
 *   dcos_role = "master"
 *   resource_group_name = "test"
 *   location = "West US"
 * }
 * ```
 */

provider "azurerm" {}
