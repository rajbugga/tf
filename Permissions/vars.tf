variable "sql_can_use_groups" {
  description = "Groups with CAN_USE permission"
  type        = list(string)
}

variable "sql_can_manage_groups" {
  description = "Groups with CAN_MANAGE permission"
  type        = list(string)
}

variable "clusters_can_manage_groups" {
  description = "Groups with CAN_MANAGE permission"
  type        = list(string)
}

variable "clusters_can_attach_to_groups" {
  description = "Groups with CAN_ATTACH_TO permission"
  type        = list(string)
}

variable "clusters_can_restart_groups" {
  description = "Groups with CAN_RESTART permission"
  type        = list(string)
}
