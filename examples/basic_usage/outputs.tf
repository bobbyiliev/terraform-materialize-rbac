output "dev_database_names" {
  description = "The names of the created databases."
  value       = module.materialize_rbac_dev.database_names
}

output "dev_role_names" {
  description = "The names of the created roles."
  value       = module.materialize_rbac_dev.role_names
}

output "dev_cluster_names" {
  description = "The names of the created clusters."
  value       = module.materialize_rbac_dev.cluster_names
}

output "prod_database_names" {
  description = "The names of the created databases."
  value       = module.materialize_rbac_prod.database_names
}

output "prod_role_names" {
  description = "The names of the created roles."
  value       = module.materialize_rbac_prod.role_names
}

output "prod_cluster_names" {
  description = "The names of the created clusters."
  value       = module.materialize_rbac_prod.cluster_names
}
