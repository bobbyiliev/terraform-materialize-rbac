resource "materialize_database" "databases" {
  for_each = var.team_names
  name     = "${each.value}_${var.environment_name}"
}

resource "materialize_cluster" "clusters" {
  for_each           = var.team_names
  name               = "${each.value}_${var.environment_name}"
  size               = var.cluster_size
  replication_factor = var.cluster_replication_factor
  ownership_role     = materialize_role.roles[each.value].name
}

resource "materialize_schema" "schemas" {
  for_each       = var.team_names
  name           = var.environment_name
  database_name  = materialize_database.databases[each.value].name
  ownership_role = materialize_role.roles[each.value].name
}

resource "materialize_role" "roles" {
  for_each = var.team_names
  name     = "${each.value}_${var.environment_name}_role"
}

resource "materialize_role_parameter" "role_database_parameters" {
  for_each       = var.team_names
  role_name      = materialize_role.roles[each.value].name
  variable_name  = "database"
  variable_value = each.value
}

resource "materialize_role_parameter" "role_cluster_parameters" {
  for_each       = var.team_names
  role_name      = materialize_role.roles[each.value].name
  variable_name  = "cluster"
  variable_value = "${each.value}_${var.environment_name}"
}

resource "materialize_role_parameter" "role_search_path_parameters" {
  for_each       = var.team_names
  role_name      = materialize_role.roles[each.value].name
  variable_name  = "search_path"
  variable_value = var.environment_name
}

locals {
  cluster_schema_database_perms = {
    for pair in setproduct(var.team_names, var.all_cluster_schema_database_perms) :
    "${pair[0]}_${pair[1]}" => {
      database   = materialize_database.databases[pair[0]].name
      permission = pair[1]
      role       = materialize_role.roles[pair[0]].name
      cluster    = materialize_cluster.clusters[pair[0]].name
      schema     = materialize_schema.schemas[pair[0]].name
    }
  }
}

resource "materialize_database_grant" "db_grant" {
  for_each      = local.cluster_schema_database_perms
  privilege     = each.value.permission
  role_name     = each.value.role
  database_name = each.value.database
}

resource "materialize_cluster_grant" "cluster_grant" {
  for_each     = local.cluster_schema_database_perms
  privilege    = each.value.permission
  cluster_name = each.value.cluster
  role_name    = each.value.role
}

resource "materialize_schema_grant" "schema_grant" {
  for_each      = local.cluster_schema_database_perms
  privilege     = each.value.permission
  role_name     = each.value.role
  database_name = each.value.database
  schema_name   = each.value.schema
}

resource "materialize_grant_system_privilege" "system_privilege_grant" {
  privilege = "CREATECLUSTER"
  for_each  = var.team_names
  role_name = materialize_role.roles[each.value].name
}

locals {
  table_perms = {
    for pair in setproduct(var.team_names, var.all_table_perms) :
    "${pair[0]}_${pair[1]}" => {
      database   = materialize_database.databases[pair[0]].name
      permission = pair[1]
      role       = materialize_role.roles[pair[0]].name
      cluster    = materialize_cluster.clusters[pair[0]].name
      schema     = materialize_schema.schemas[pair[0]].name
    }
  }
}

resource "materialize_table_grant_default_privilege" "table_default_privilege_grant" {
  for_each         = local.table_perms
  target_role_name = "PUBLIC"
  grantee_name     = each.value.role
  privilege        = each.value.permission
  database_name    = each.value.database
  schema_name      = each.value.schema
}

resource "materialize_type_grant_default_privilege" "type_default_privilege_grant" {
  for_each         = var.team_names
  target_role_name = "PUBLIC"
  grantee_name     = materialize_role.roles[each.value].name
  privilege        = "USAGE"
  database_name    = materialize_database.databases[each.value].name
  schema_name      = materialize_schema.schemas[each.value].name
}

resource "materialize_connection_grant_default_privilege" "connection_default_privilege_grant" {
  for_each         = var.team_names
  target_role_name = "PUBLIC"
  grantee_name     = materialize_role.roles[each.value].name
  privilege        = "USAGE"
  database_name    = materialize_database.databases[each.value].name
  schema_name      = materialize_schema.schemas[each.value].name
}

resource "materialize_secret_grant_default_privilege" "secret_default_privilege_grant" {
  for_each         = var.team_names
  target_role_name = "PUBLIC"
  grantee_name     = materialize_role.roles[each.value].name
  privilege        = "USAGE"
  database_name    = materialize_database.databases[each.value].name
  schema_name      = materialize_schema.schemas[each.value].name
}
