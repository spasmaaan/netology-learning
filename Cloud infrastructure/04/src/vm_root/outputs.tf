output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
}

output "vault_example2" {
 value = "${nonsensitive(vault_kv_secret.example.data)}"
} 
