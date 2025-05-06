provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

# Ressourcengruppe
resource "azurerm_resource_group" "rg" {
  name     = "SCEPman-Walo-test"
  location = "Switzerland North"
}

# App Service Plan (Windows)
resource "azurerm_app_service_plan" "asp" {
  name                = "asp-scepman-Walo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Windows"
  reserved            = false

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Key Vault
resource "azurerm_key_vault" "kv" {
  name                        = "kv-scepman-Walo"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = true
  enable_rbac_authorization   = true
}

# Storage Account für SCEPman-Konfiguration
resource "azurerm_storage_account" "storage" {
  name                     = "stscepmanwalo"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Application Insights (optional, aber empfohlen)
resource "azurerm_application_insights" "appi" {
  name                = "appi-scepman-Walo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

# Log Analytics Workspace (optional, aber empfohlen)
resource "azurerm_log_analytics_workspace" "log" {
  name                = "log-scepman-Walo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# SCEPman App Service (Windows App)
resource "azurerm_app_service" "app" {
  name                = "app-scepman-Walo-test"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "SCEPMAN_LICENSE"                     = "trial"
    "SCEPMAN_ORGANIZATION_NAME"           = "Walo Bertschinger Central AG"
    "SCEPMAN_KEYVAULT_NAME"               = "kv-scepman-Walo"
    "SCEPMAN_CAKEY_TYPE"                  = "RSA-HSM"
    "SCEPMAN_STORAGE_ACCOUNT_NAME"        = "stscepmanwalo"
    "APPINSIGHTS_INSTRUMENTATIONKEY"      = azurerm_application_insights.appi.instrumentation_key
  }

  site_config {
    always_on = true
  }
}
