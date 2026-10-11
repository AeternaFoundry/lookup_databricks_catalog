output "catalog_lookup_id" {
  description = "Map of id values across all catalog_lookup, keyed the same as var.catalog_lookup except keys with no id are omitted"
  value       = { for k, v in data.databricks_catalog.catalog_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "catalog_lookup_catalog_info" {
  description = "Map of catalog_info values across all catalog_lookup, keyed the same as var.catalog_lookup except keys with no catalog_info are omitted"
  value       = { for k, v in data.databricks_catalog.catalog_lookup : k => one(v.catalog_info) if v.catalog_info != null && length(v.catalog_info) > 0 }
}
output "catalog_lookup_name" {
  description = "Map of name values across all catalog_lookup, keyed the same as var.catalog_lookup except keys with no name are omitted"
  value       = { for k, v in data.databricks_catalog.catalog_lookup : k => v.name if v.name != null && length(v.name) > 0 }
}
output "catalog_lookup_provider_config" {
  description = "Map of provider_config values across all catalog_lookup, keyed the same as var.catalog_lookup except keys with no provider_config are omitted"
  value       = { for k, v in data.databricks_catalog.catalog_lookup : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}

