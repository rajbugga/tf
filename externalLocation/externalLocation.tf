terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
  }
}



resource "databricks_external_location" "external_location" {
  for_each        = var.external_location
  name            = each.value.external_location_name
  url             = "gs://${each.value.bucket_name}"
  credential_name = "8b4fae3f-eeac-486f-8d8a-4ca2a41ce4fa-data-access-config-1690208748469"
  comment         = "Managed by TF"
}

resource "databricks_grants" "externalGrants" {
  for_each = var.external_location

  external_location = each.value.external_location_name

  dynamic "grant" {
    for_each = var.groups
    content {
      principal  = grant.value
      privileges = ["ALL PRIVILEGES"]
    }
  }
}

