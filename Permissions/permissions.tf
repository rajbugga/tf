terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
  }
}


data "databricks_sql_warehouses" "all" {
}

data "databricks_sql_warehouse" "allSQL" {
  for_each = data.databricks_sql_warehouses.all.ids
  id       = each.value
}

resource "databricks_permissions" "sqlPermissions" {
  for_each = data.databricks_sql_warehouse.allSQL

  # Dynamic block for CAN_USE permission groups
  dynamic "access_control" {
    for_each = var.sql_can_use_groups
    content {
      group_name       = access_control.value
      permission_level = "CAN_USE"
    }
  }

  # Dynamic block for CAN_MANAGE permission groups
  dynamic "access_control" {
    for_each = var.sql_can_manage_groups
    content {
      group_name       = access_control.value
      permission_level = "CAN_MANAGE"
    }
  }
}

data "databricks_clusters" "all" {
}

data "databricks_cluster" "allClusters" {
  for_each   = data.databricks_clusters.all.ids
  cluster_id = each.value
}

resource "databricks_permissions" "clusterPermissions" {
  for_each = data.databricks_cluster.allClusters

  dynamic "access_control" {
    for_each = var.clusters_can_attach_to_groups
    content {
      group_name       = access_control.value
      permission_level = "CAN_ATTACH_TO"
    }
  }

  dynamic "access_control" {
    for_each = var.clusters_can_restart_groups
    content {
      group_name       = access_control.value
      permission_level = "CAN_RESTART"
    }
  }

  dynamic "access_control" {
    for_each = var.clusters_can_manage_groups
    content {
      group_name       = access_control.value
      permission_level = "CAN_MANAGE"
    }
  }
}
