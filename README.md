<!-- BEGIN_TF_DOCS -->
# Materialize RBAC Terraform Module

This Terraform module sets up Role-Based Access Control (RBAC) for multiple teams in Materialize. It creates and configures databases, clusters, schemas, and roles for each team across different environments (`prod`, `dev`, `sandbox`), ensuring proper entitlements and deployments.

* **Database Creation**: Creates databases for each team, named according to the environment.
* **Cluster Management**: Configures clusters with specified sizes and replication factors, assigning ownership to appropriate roles.
* **Schema Setup**: Establishes schemas within each database, owned by designated roles.
* **Role Configuration**: Defines roles for production, development, and sandbox environments with tailored permissions.
* **Role Parameters**: Sets database, cluster, and search path parameters for each role.
* **Permissions Management**: Grants necessary permissions on databases, clusters, schemas, tables, types, connections, and secrets.

> **Warning** This is provided on a best-effort basis and Materialize cannot offer support for this module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_materialize"></a> [materialize](#requirement\_materialize) | ~> 0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_materialize"></a> [materialize](#provider\_materialize) | 0.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [materialize_cluster.clusters](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/cluster) | resource |
| [materialize_cluster_grant.cluster_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/cluster_grant) | resource |
| [materialize_connection_grant_default_privilege.connection_default_privilege_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/connection_grant_default_privilege) | resource |
| [materialize_database.databases](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/database) | resource |
| [materialize_database_grant.db_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/database_grant) | resource |
| [materialize_grant_system_privilege.system_privilege_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/grant_system_privilege) | resource |
| [materialize_role.roles](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/role) | resource |
| [materialize_role_parameter.role_cluster_parameters](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/role_parameter) | resource |
| [materialize_role_parameter.role_database_parameters](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/role_parameter) | resource |
| [materialize_role_parameter.role_search_path_parameters](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/role_parameter) | resource |
| [materialize_schema.schemas](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/schema) | resource |
| [materialize_schema_grant.schema_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/schema_grant) | resource |
| [materialize_secret_grant_default_privilege.secret_default_privilege_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/secret_grant_default_privilege) | resource |
| [materialize_table_grant_default_privilege.table_default_privilege_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/table_grant_default_privilege) | resource |
| [materialize_type_grant_default_privilege.type_default_privilege_grant](https://registry.terraform.io/providers/MaterializeInc/materialize/latest/docs/resources/type_grant_default_privilege) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_cluster_schema_database_perms"></a> [all\_cluster\_schema\_database\_perms](#input\_all\_cluster\_schema\_database\_perms) | Permissions for clusters, schemas, and databases. | `set(string)` | <pre>[<br>  "USAGE",<br>  "CREATE"<br>]</pre> | no |
| <a name="input_all_table_perms"></a> [all\_table\_perms](#input\_all\_table\_perms) | Permissions for tables. | `set(string)` | <pre>[<br>  "INSERT",<br>  "SELECT",<br>  "UPDATE",<br>  "DELETE"<br>]</pre> | no |
| <a name="input_cluster_replication_factor"></a> [cluster\_replication\_factor](#input\_cluster\_replication\_factor) | Replication factor of the cluster. | `number` | `1` | no |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Size of the cluster for each team. | `string` | `"50cc"` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The name of the environment (e.g., dev, prod, sandbox) that will have its own clusters. | `string` | n/a | yes |
| <a name="input_team_names"></a> [team\_names](#input\_team\_names) | The names of the independent teams that will get their own databases and roles. | `set(string)` | <pre>[<br>  "analytics",<br>  "dataeng"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_names"></a> [cluster\_names](#output\_cluster\_names) | The names of the created clusters. |
| <a name="output_database_names"></a> [database\_names](#output\_database\_names) | The names of the created databases. |
| <a name="output_role_names"></a> [role\_names](#output\_role\_names) | The names of the created roles. |
| <a name="output_schema_names"></a> [schema\_names](#output\_schema\_names) | The names of the created schemas. |
| <a name="output_team_names"></a> [team\_names](#output\_team\_names) | The names of the independent teams that will get their own databases and roles. |
<!-- END_TF_DOCS -->
