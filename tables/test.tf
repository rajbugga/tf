
terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
  }
}

# data "databricks_tables" "things" {
#   catalog_name = "hive_metastore"
#   schema_name  = "agp_aggregations"
# }

data "databricks_tables" "things" {
  catalog_name = "dev"
  schema_name  = "uc_migration_test"
}

output "all_tables" {
  value = data.databricks_tables.things.ids
}

