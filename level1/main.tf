module "vpc" {
  source             = "../modules/vpc/"
  project            = "lab"
  public_cidr        = ["10.0.0.0/24", "10.0.1.0/24"]
  private_cidr       = ["10.0.2.0/24", "10.0.3.0/24"]
  availability_zones = ["ru-central1-a", "ru-central1-b"]
}


