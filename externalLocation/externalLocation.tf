terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
  }
}

resource "databricks_storage_credential" "ext" {
  name = var.databricks_credential_name
  databricks_gcp_service_account {}
}

resource "databricks_external_location" "some" {
  name            = var.external_location_name
  url             = "gs://${var.bucket_name}"
  credential_name = databricks_storage_credential.ext.id
  comment         = "Managed by TF"
}
