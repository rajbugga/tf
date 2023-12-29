terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
  }
}

resource "databricks_sql_table" "parquetTable" {
  name               = var.table_name
  catalog_name       = var.catalog_name
  schema_name        = var.schema_name
  table_type         = var.table_type
  data_source_format = var.data_source_format
  storage_location   = var.storage_location
}
