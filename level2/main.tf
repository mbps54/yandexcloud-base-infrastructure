locals {
  project             = "terraform-yandex-vpn"
  vpc_id              = data.terraform_remote_state.level1.outputs.yandex_vpc_network
  public_subnets      = data.terraform_remote_state.level1.outputs.public_subnets
  private_subnets     = data.terraform_remote_state.level1.outputs.private_subnets
  public_subnets_ids  = data.terraform_remote_state.level1.outputs.public_subnets_ids
  private_subnets_ids = data.terraform_remote_state.level1.outputs.private_subnets_ids
}

#resource "yandex_vpc_security_group" "sg-lab" {
#  name       = "Lab security group"
#  network_id = local.vpc_id
#
#  ingress {
#    protocol       = "TCP"
#    description    = "SSH access"
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 22
#  }
#
#  ingress {
#    protocol       = "TCP"
#    description    = "HTTP access"
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    port           = 80
#  }
#
#  egress {
#    protocol       = "ANY"
#    description    = "full access"
#    v4_cidr_blocks = ["0.0.0.0/0"]
#    from_port      = 0
#    to_port        = 0
#  }
#
#  labels = {
#    my-label = "sg-lab"
#  }
#}

data "yandex_compute_image" "ubuntu_image" {
  family = "debian-9"
}

resource "yandex_compute_instance" "lab" {
  name        = "lab"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
    }
  }

  network_interface {
    subnet_id          = local.public_subnets_ids[0]
    nat                = true
    #security_group_ids = [yandex_vpc_security_group.sg-lab.id]
  }

  metadata = {
    serial-port-enable = 1
    user-data = "${file("./metadata.yaml")}"
  }
}