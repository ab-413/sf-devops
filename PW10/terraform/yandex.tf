terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.64.0"
    }
  }
}

provider "yandex" {
  token     = var.ya_token
  cloud_id  = var.ya_cloud_id
  folder_id = var.ya_folder_id
  zone      = var.ya_zone
}

resource "null_resource" "gen_inventory" {
  provisioner "local-exec" {
    command = "python3 /home/alex/sf-devops/PW10/ansible/inventory_gen.py"
  }
  depends_on = [
    yandex_compute_instance.vm-1,
    yandex_compute_instance.vm-2,
    yandex_compute_instance.vm-3
  ]
}

# Add waiting 1 min for hosts network up
resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    command = "sleep 60 && ansible-playbook -i /home/alex/sf-devops/PW10/ansible/hosts.ini /home/alex/sf-devops/PW10/ansible/pw10.yml"
  }
  depends_on = [null_resource.gen_inventory]
}
