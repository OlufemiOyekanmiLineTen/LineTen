variable "subscription_id" {
  default = "c5808d2a-9117-446f-bcb7-3d65993bbef2"
}

variable "client_id" {
  default = "63ad965f-fb30-42fc-b16f-d5181257c0da"
}

variable "client_secret" {
  default = "tYb8Q~yvIg40pZPdEW8Gf52cFrJ26r4d5KPcfcO2"
}

variable "tenant_id" {
  default = "ea7159a9-ebae-4765-9f8b-34922c51aa36"
}

variable "resource_group_name" {
  default = "linetendemo-rg"
}

variable "agent_count" {
  default = 3
}

variable "dns_prefix" {
  default = "ak8s"
}

variable "cluster_name" {
  default = "ak8s"
}

variable "location" {
  default = "westeurope"
}

variable "log_analytics_workspace_name" {
  default = "linetenLogAnalyticsWorkspaceName"
}

variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}