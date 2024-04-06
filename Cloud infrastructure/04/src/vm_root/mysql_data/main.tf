resource "yandex_mdb_mysql_database" "db" {
  cluster_id = var.cluster_id
  name       = var.database
}
resource "yandex_mdb_mysql_user" "user" {
	cluster_id = var.cluster_id
  name       = var.user
  password   = var.password

  permission {
    database_name = var.database
    roles         = ["ALL"]
  }
}
