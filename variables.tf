variable "catalog_lookup" {
  description = <<EOT
Map of catalog_lookup, attributes below
Required:
    - name
Optional:
    - catalog_info (block):
        - browse_only (optional)
        - catalog_type (optional)
        - comment (optional)
        - connection_name (optional)
        - created_at (optional)
        - created_by (optional)
        - custom_max_retention_hours (optional)
        - effective_predictive_optimization_flag (optional, block):
            - inherited_from_name (optional)
            - inherited_from_type (optional)
            - value (required)
        - enable_predictive_optimization (optional)
        - full_name (optional)
        - isolation_mode (optional)
        - managed_encryption_settings (optional, block):
            - azure_encryption_settings (optional, block):
                - azure_cmk_access_connector_id (optional)
                - azure_cmk_managed_identity_id (optional)
                - azure_tenant_id (required)
            - azure_key_vault_key_id (optional)
            - customer_managed_key_id (optional)
        - metastore_id (optional)
        - name (optional)
        - options (optional)
        - owner (optional)
        - properties (optional)
        - provider_name (optional)
        - provisioning_info (optional, block):
            - state (optional)
        - securable_type (optional)
        - share_name (optional)
        - storage_location (optional)
        - storage_root (optional)
        - updated_at (optional)
        - updated_by (optional)
    - provider_config (block):
        - workspace_id (optional)
EOT

  type = map(object({
    name = string
    catalog_info = optional(object({
      browse_only                = optional(bool)
      catalog_type               = optional(string)
      comment                    = optional(string)
      connection_name            = optional(string)
      created_at                 = optional(number)
      created_by                 = optional(string)
      custom_max_retention_hours = optional(number)
      effective_predictive_optimization_flag = optional(object({
        inherited_from_name = optional(string)
        inherited_from_type = optional(string)
        value               = string
      }))
      enable_predictive_optimization = optional(string)
      full_name                      = optional(string)
      isolation_mode                 = optional(string)
      managed_encryption_settings = optional(object({
        azure_encryption_settings = optional(object({
          azure_cmk_access_connector_id = optional(string)
          azure_cmk_managed_identity_id = optional(string)
          azure_tenant_id               = string
        }))
        azure_key_vault_key_id  = optional(string)
        customer_managed_key_id = optional(string)
      }))
      metastore_id  = optional(string)
      name          = optional(string)
      options       = optional(map(string))
      owner         = optional(string)
      properties    = optional(map(string))
      provider_name = optional(string)
      provisioning_info = optional(object({
        state = optional(string)
      }))
      securable_type   = optional(string)
      share_name       = optional(string)
      storage_location = optional(string)
      storage_root     = optional(string)
      updated_at       = optional(number)
      updated_by       = optional(string)
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
  }))
}

