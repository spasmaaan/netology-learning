output "database" {
    value = yandex_mdb_mysql_database.db
    description = "Database"
}

output "user" {
    value = yandex_mdb_mysql_user.user
    description = "Database user"
}

