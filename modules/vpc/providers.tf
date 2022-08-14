terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "AQAAAABbAZUJAATuwXV66fviGUgkiIZTsELBGBM"
  cloud_id  = "b1go9abnqa3a59eukr4q"
  folder_id = "b1gid385ik4stiuai6u0"
  zone      = "ru-central1-a"
}
