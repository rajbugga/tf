
variable "external_location" {
  type = map(object({
    external_location_name = string
    bucket_name            = string
  }))
  default = null
}
variable "groups" {
  description = "Groups with all privileges permission"
  type        = list(string)

}