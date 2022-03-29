locals {
  tags = {
    managed-by   = "terraform"
    environment = "dev"
  }
  vpc_cidr = "172.20.0.0/16"
  private_subnets = ["172.20.20.0/24"]
  public_subnets = ["172.20.10.0/24"]
  region = "us-east-1"
}
