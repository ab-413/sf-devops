output "vm1_public_ip" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "vm2_public_ip" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}

output "vm3_public_ip" {
  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
}
