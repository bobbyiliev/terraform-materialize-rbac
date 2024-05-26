variable "team_names" {
  description = "The names of the independent teams that will get their own databases and roles."
  type        = set(string)
  default     = ["analytics", "dataeng"]
}

variable "environment_name" {
  description = "The name of the environment (e.g., dev, prod, sandbox) that will have its own clusters."
  type        = string
}

variable "all_cluster_schema_database_perms" {
  description = "Permissions for clusters, schemas, and databases."
  type        = set(string)
  default     = ["USAGE", "CREATE"]
}

variable "all_table_perms" {
  description = "Permissions for tables."
  type        = set(string)
  default     = ["INSERT", "SELECT", "UPDATE", "DELETE"]
}

variable "cluster_size" {
  description = "Size of the cluster for each team."
  type        = string
  default     = "50cc"
}

variable "cluster_replication_factor" {
  description = "Replication factor of the cluster."
  type        = number
  default     = 1
}
