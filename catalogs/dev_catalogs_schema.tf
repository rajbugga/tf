terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
  }
}

resource "databricks_catalog" "dev_one_dt_datalake" {
  name    = "dev_one_dt_datalake"
  comment = "this catalog is managed by terraform"
  properties = {
    purpose = "Dev Catalog"
  }
}

resource "databricks_schema" "schemas" {
  for_each     = toset(var.schemas)
  catalog_name = databricks_catalog.dev_one_dt_datalake.id
  name         = each.key
  comment      = "Schema ${each.key} managed by terraform"
}
