variable "table_name" {
  type        = string
  description = "Name of the SQL table"
}

variable "catalog_name" {
  type        = string
  description = "Catalog name for the table"
}

variable "schema_name" {
  type        = string
  description = "Schema name for the table"
}

variable "table_type" {
  type        = string
  description = "Type of the SQL table"
}

variable "data_source_format" {
  type        = string
  description = "Data source format for the table"
}

variable "storage_location" {
  type        = string
  description = "Storage location for the table"
}
