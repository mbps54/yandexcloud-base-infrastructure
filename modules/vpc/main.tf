resource "yandex_vpc_network" "lab-net" {
  name = var.project
}

resource "yandex_vpc_subnet" "lab-private" {
  count          = length(var.private_cidr)
  v4_cidr_blocks = [var.private_cidr[count.index]]
  zone           = var.availability_zones[count.index]
  network_id     = yandex_vpc_network.lab-net.id
  #route_table_id = yandex_vpc_route_table.lab-rt-private.id
}

resource "yandex_vpc_subnet" "lab-public" {
  count          = length(var.public_cidr)
  v4_cidr_blocks = [var.public_cidr[count.index]]
  zone           = var.availability_zones[count.index]
  network_id     = yandex_vpc_network.lab-net.id
  #route_table_id = yandex_vpc_route_table.lab-rt-public.id
}
