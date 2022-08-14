output "yandex_vpc_network" {
  value       = yandex_vpc_network.lab-net.id
  description = "vpc id"
}

output "public_subnets_id" {
  value = yandex_vpc_subnet.lab-public.*.id
}

output "private_subnets_id" {
  value = yandex_vpc_subnet.lab-private.*.id
}

output "public_subnets" {
  value = flatten(yandex_vpc_subnet.lab-public.*.v4_cidr_blocks)[*]
}

output "private_subnets" {
  value = flatten(yandex_vpc_subnet.lab-private.*.v4_cidr_blocks)[*]
}
