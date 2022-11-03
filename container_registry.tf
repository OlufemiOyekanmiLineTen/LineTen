resource "azurerm_container_registry" "lineten_acr" {
  name                = "olufemilinetenacr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = false
}