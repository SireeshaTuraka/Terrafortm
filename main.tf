provider "azurerm" {
features {}
}
resource "azurerm_resource_group" "RG" {
  name     = var.rgname
  location = var.location
}
resource "azurerm_app_service_plan" "test" {
  name                = var.aspname
  location            = "${azurerm_resource_group.RG.location}"
  resource_group_name = "${azurerm_resource_group.RG.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}
