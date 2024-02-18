resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl", { 
    webservers = yandex_compute_instance.web,
    dbservers  = yandex_compute_instance.db,
    storages   = tolist([yandex_compute_instance.storage])
  })

  filename = "${abspath(path.module)}/${local.ansible_hosts_cfg_filename}"
}

resource "null_resource" "web_hosts_provision" {
  count = var.web_provision == true ? 1 : 0
  depends_on = yandex_compute_instance.web

  provisioner "local-exec" {
    command = "cat ~/.ssh/id_ed25519 | ssh-add -"
  }

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