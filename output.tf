
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "client_key" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.username
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.password
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.aks_cluster.fqdn
}

# # Azure AD Group Object Id
# output "azure_ad_group_id" {
#   value = azuread_group.aks_administrators.id
# }
# output "azure_ad_group_objectid" {
#   value = azuread_group.aks_administrators.object_id
# }

