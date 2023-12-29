variable "bucket_name" {
  type        = string
  description = "Name of the Google Storage bucket"
}

variable "databricks_credential_name" {
  type        = string
  description = "Name for the Databricks storage credential"
}

variable "external_location_name" {
  type        = string
  description = "Name for the Databricks external location"
}
