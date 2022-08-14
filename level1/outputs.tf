output "yandex_vpc_network" {
  value = module.vpc.yandex_vpc_network
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets_id
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
