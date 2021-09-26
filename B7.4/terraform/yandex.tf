terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

provider "yandex" {
  token     = "token"
  cloud_id  = "cloud_id"
  folder_id = "folder_id"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name = "master"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    auto_delete = true
    initialize_params {      
      image_id = "fd80viupr3qjr5g6g9du"
      size     = 20
    }
  }

  network_interface {
    subnet_id = "subnet_id"
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/alex/tf/meta")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "node1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    auto_delete = true
    initialize_params {      
      image_id = "fd80viupr3qjr5g6g9du"
      size     = 20
    }
  }

  network_interface {
    subnet_id = "subnet_id"
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/alex/tf/meta")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "vm-3" {
  name = "node2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    auto_delete = true
    initialize_params {      
      image_id = "fd80viupr3qjr5g6g9du"
      size     = 20
    }
  }

  network_interface {
    subnet_id = "subnet_id"
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/alex/tf/meta")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
