data "databricks_catalog" "catalog_lookup" {
  for_each = var.catalog_lookup

  name = each.value.name

  dynamic "catalog_info" {
    for_each = each.value.catalog_info != null ? [each.value.catalog_info] : []
    content {
      browse_only                = catalog_info.value.browse_only
      catalog_type               = catalog_info.value.catalog_type
      comment                    = catalog_info.value.comment
      connection_name            = catalog_info.value.connection_name
      created_at                 = catalog_info.value.created_at
      created_by                 = catalog_info.value.created_by
      custom_max_retention_hours = catalog_info.value.custom_max_retention_hours
      dynamic "effective_predictive_optimization_flag" {
        for_each = catalog_info.value.effective_predictive_optimization_flag != null ? [catalog_info.value.effective_predictive_optimization_flag] : []
        content {
          inherited_from_name = effective_predictive_optimization_flag.value.inherited_from_name
          inherited_from_type = effective_predictive_optimization_flag.value.inherited_from_type
          value               = effective_predictive_optimization_flag.value.value
        }
      }
      enable_predictive_optimization = catalog_info.value.enable_predictive_optimization
      full_name                      = catalog_info.value.full_name
      isolation_mode                 = catalog_info.value.isolation_mode
      dynamic "managed_encryption_settings" {
        for_each = catalog_info.value.managed_encryption_settings != null ? [catalog_info.value.managed_encryption_settings] : []
        content {
          dynamic "azure_encryption_settings" {
            for_each = managed_encryption_settings.value.azure_encryption_settings != null ? [managed_encryption_settings.value.azure_encryption_settings] : []
            content {
              azure_cmk_access_connector_id = azure_encryption_settings.value.azure_cmk_access_connector_id
              azure_cmk_managed_identity_id = azure_encryption_settings.value.azure_cmk_managed_identity_id
              azure_tenant_id               = azure_encryption_settings.value.azure_tenant_id
            }
          }
          azure_key_vault_key_id  = managed_encryption_settings.value.azure_key_vault_key_id
          customer_managed_key_id = managed_encryption_settings.value.customer_managed_key_id
        }
      }
      metastore_id  = catalog_info.value.metastore_id
      name          = catalog_info.value.name
      options       = catalog_info.value.options
      owner         = catalog_info.value.owner
      properties    = catalog_info.value.properties
      provider_name = catalog_info.value.provider_name
      dynamic "provisioning_info" {
        for_each = catalog_info.value.provisioning_info != null ? [catalog_info.value.provisioning_info] : []
        content {
          state = provisioning_info.value.state
        }
      }
      securable_type   = catalog_info.value.securable_type
      share_name       = catalog_info.value.share_name
      storage_location = catalog_info.value.storage_location
      storage_root     = catalog_info.value.storage_root
      updated_at       = catalog_info.value.updated_at
      updated_by       = catalog_info.value.updated_by
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

