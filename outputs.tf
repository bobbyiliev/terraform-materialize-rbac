output "database_names" {
  description = "The names of the created databases."
  value       = values(materialize_database.databases)[*].name
}

output "role_names" {
  description = "The names of the created roles."
  value       = values(materialize_role.roles)[*].name
}

output "cluster_names" {
  description = "The names of the created clusters."
  value       = values(materialize_cluster.clusters)[*].name
}

output "schema_names" {
  description = "The names of the created schemas."
  value       = values(materialize_schema.schemas)[*].name
}

output "team_names" {
  description = "The names of the independent teams that will get their own databases and roles."
  value       = var.team_names
}
