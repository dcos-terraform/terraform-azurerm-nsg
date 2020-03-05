[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/buildStatus/icon?job=dcos-terraform%2Fterraform-azurerm-nsg%2Fsupport%252F0.2.x)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-nsg/job/support%252F0.2.x/)

azurerm nsg
===========
The module creates DC/OS Network Security Groups per DC/OS role on AzureRM.

EXAMPLE
-------

```hcl
module "dcos-security-groups" {
  source  = "dcos-terraform/nsg/azurerm"
  version = "~> 0.2.0"

  resource_group_name = "test"
  location            = "West US"
  subnet_range        = ["10.0.10.0/24"]
  admin_ips           = ["1.2.3.4/32"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_ips | List of CIDR admin IPs | list | n/a | yes |
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| location | Azure Region | string | n/a | yes |
| num\_bootstrap | Specify the amount of bootstrap. You should have at most 1 | string | n/a | yes |
| num\_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | n/a | yes |
| num\_private\_agents | Specify the amount of private agents. These agents will provide your main resources | string | n/a | yes |
| num\_public\_agents | Specify the amount of public agents. These agents will host marathon-lb and edgelb | string | n/a | yes |
| resource\_group\_name | Name of the azure resource group | string | n/a | yes |
| subnet\_range | Private IP space to be used in CIDR format | string | n/a | yes |
| adminrouter\_grpc\_proxy\_port |  | string | `"12379"` | no |
| hostname\_format | Format the hostname inputs are index+1, region, cluster_name | string | `"nsg-%[1]d-%[2]s"` | no |
| name\_prefix | Name Prefix | string | `""` | no |
| public\_agents\_additional\_ports | List of additional ports allowed for public access on public agents (80 and 443 open by default) | list | `<list>` | no |
| public\_agents\_ips | List of ips allowed access to public agents. admin_ips are joined to this list | list | `<list>` | no |
| tags | Add custom tags to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| bootstrap.nsg\_id | Network security group id of the bootstrap |
| bootstrap.nsg\_name | Network security group name of the bootstrap |
| masters.nsg\_id | Network security group id of the masters |
| masters.nsg\_name | Network security group name of the masters |
| private\_agents.nsg\_id | Network security group id of the private agents |
| private\_agents.nsg\_name | Network security group name of the private agents |
| public\_agents.nsg\_id | Network security group id of the public agents |
| public\_agents.nsg\_name | Network security group name of the public agents |

