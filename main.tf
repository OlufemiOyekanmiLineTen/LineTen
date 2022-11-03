
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}

resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "linetenlogs" {
  name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "linetenlogs" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.linetenlogs.id
  workspace_name        = azurerm_log_analytics_workspace.linetenlogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "agentpool"
    node_count = var.agent_count
    vm_size    = "Standard_D2_v2"
    enable_auto_scaling  = false
    max_count            = null
    min_count            = null
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"

    node_labels = {
    "nodepool-type"    = "system"
    "environment"      = "dev"
    "nodepoolos"       = "linux"
    "app"              = "system-apps" 
    } 
  }

  role_based_access_control {
    enabled = true
  }



  # azure will assign the id automatically
  identity {
    type = "SystemAssigned"
  }


  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = "Staging"
  }

 
}

resource "azurerm_container_registry" "acr" {
  name                = "linetenacr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true

}

# add the role to the identity the kubernetes cluster was assigned
resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
}