resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl", { 
    webservers = {
      for key, web_vm in yandex_compute_instance.web:
        key => {
          name = web_vm.name,
          ip = coalesce(web_vm.network_interface[0].nat_ip_address, web_vm.network_interface[0].ip_address), 
          fqdn = web_vm.fqdn
        }
    },
    dbservers  = {
      for key, db_vm in yandex_compute_instance.db:
        key => {
          name = db_vm.name,
          ip = coalesce(db_vm.network_interface[0].nat_ip_address, db_vm.network_interface[0].ip_address), 
          fqdn = db_vm.fqdn
        }
    },
    storages   = {
      for key, st_vm in tolist([yandex_compute_instance.storage]):
        key => {
          name = st_vm.name,
          ip = coalesce(st_vm.network_interface[0].nat_ip_address, st_vm.network_interface[0].ip_address), 
          fqdn = st_vm.fqdn
        }
    }
  })
  filename = "${abspath(path.module)}/${local.ansible_hosts_cfg_filename}"
}

resource "null_resource" "web_hosts_provision" {
  count = var.web_provision == true ? 1 : 0
  depends_on = [yandex_compute_instance.web]

  provisioner "local-exec" {
    command     = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/${local.ansible_hosts_cfg_filename} ${abspath(path.module)}/${local.ansible_playbook_filename} --extra-vars '{\"secrets\": ${jsonencode( {for k,v in random_password.web: k=>v.result})} }'"
    on_failure  = continue
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  }
  triggers = {
    playbook_src_hash = file("${abspath(path.module)}/${local.ansible_playbook_filename}")
    ssh_public_key    = file(var.vms_ssh_root_keyfile)
    template_rendered = "${local_file.hosts_templatefile.content}"
  }
}