output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.stg.name
}

output "storage_account_id" {
  value = azurerm_storage_account.stg.id
}
