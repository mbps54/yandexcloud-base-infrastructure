output "instance_public_ip" {
  value = one(flatten(yandex_compute_instance.lab.network_interface)[*].nat_ip_address)
}
