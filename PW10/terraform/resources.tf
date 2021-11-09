resource "yandex_compute_instance" "vm-1" {
  name = "vm1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      image_id = "fd83mnmdqlojapdpoup3" # Yandex Ubuntu 20.04
      size     = 20
    }
  }

  network_interface {
    subnet_id = var.ya_subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta")}"
  }

  scheduling_policy {
    preemptible = true
  }

  allow_stopping_for_update = true

}

resource "yandex_compute_instance" "vm-2" {
  name = "vm2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      image_id = "fd83mnmdqlojapdpoup3" # Yandex Ubuntu 20.04
      size     = 20
    }
  }

  network_interface {
    subnet_id = var.ya_subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta")}"
  }

  scheduling_policy {
    preemptible = true
  }

  allow_stopping_for_update = true
}

resource "yandex_compute_instance" "vm-3" {
  name = "vm3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      image_id = "fd81lesr11r8ri7p0jjc" # Yandex CentOS 8
      size     = 20
    }
  }

  network_interface {
    subnet_id = var.ya_subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta")}"
  }

  scheduling_policy {
    preemptible = true
  }

  allow_stopping_for_update = true
}


