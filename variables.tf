variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "name_prefix" {
  description = "Name Prefix"
  default     = ""
}

variable "hostname_format" {
  description = "Format the hostname inputs are index+1, region, cluster_name"
  default     = "nsg-%[1]d-%[2]s-%s"
}

variable "resource_group_name" {
  description = "Name of the azure resource group"
}

variable "location" {
  description = "Azure Region"
}

variable "tags" {
  description = "Add custom tags to all resources"
  type        = map(string)
  default     = {}
}

variable "admin_ips" {
  description = "List of CIDR admin IPs"
  type        = list(string)
}

variable "public_agents_ips" {
  description = "List of ips allowed access to public agents. admin_ips are joined to this list"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "public_agents_additional_ports" {
  description = "List of additional ports allowed for public access on public agents (80 and 443 open by default)"
  type        = list(string)
  default     = []
}

variable "subnet_range" {
  description = "Private IP space to be used in CIDR format"
}

variable "num_bootstrap" {
  description = "Specify the amount of bootstrap. You should have at most 1"
}

variable "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
}

variable "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
}

variable "num_public_agents" {
  description = "Specify the amount of public agents. These agents will host marathon-lb and edgelb"
}

