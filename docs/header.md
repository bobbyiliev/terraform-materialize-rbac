# Materialize RBAC Terraform Module

This Terraform module sets up Role-Based Access Control (RBAC) for multiple teams in Materialize. It creates and configures databases, clusters, schemas, and roles for each team across different environments (`prod`, `dev`, `sandbox`), ensuring proper entitlements and deployments.

* **Database Creation**: Creates databases for each team, named according to the environment.
* **Cluster Management**: Configures clusters with specified sizes and replication factors, assigning ownership to appropriate roles.
* **Schema Setup**: Establishes schemas within each database, owned by designated roles.
* **Role Configuration**: Defines roles for production, development, and sandbox environments with tailored permissions.
* **Role Parameters**: Sets database, cluster, and search path parameters for each role.
* **Permissions Management**: Grants necessary permissions on databases, clusters, schemas, tables, types, connections, and secrets.

> **Warning** This is provided on a best-effort basis and Materialize cannot offer support for this module.
