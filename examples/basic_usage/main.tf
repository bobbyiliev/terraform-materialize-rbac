terraform {
  required_providers {
    materialize = {
      source  = "MaterializeInc/materialize"
      version = "~> 0.8"
    }
  }
}

provider "materialize" {
  # Configuration options
}

module "materialize_rbac_dev" {
  source = "../../"

  team_names                        = ["team1", "team2"]
  environment_name                  = "dev"
  all_cluster_schema_database_perms = ["USAGE", "CREATE"]
  all_table_perms                   = ["INSERT", "SELECT", "UPDATE", "DELETE"]
  cluster_size                      = "25cc"
  cluster_replication_factor        = 1

}

module "materialize_rbac_prod" {
  source = "../../"

  team_names                        = ["team1", "team2"]
  environment_name                  = "prod"
  all_cluster_schema_database_perms = ["USAGE", "CREATE"]
  all_table_perms                   = ["INSERT", "SELECT", "UPDATE", "DELETE"]
  cluster_size                      = "50cc"
  cluster_replication_factor        = 1
}
