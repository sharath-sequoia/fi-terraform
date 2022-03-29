module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "fi-vpc"
  cidr = local.vpc_cidr
  azs             = ["${local.region}a"]
  private_subnets = local.public_subnets
  public_subnets  = local.public_subnets
  enable_nat_gateway = true
  tags = local.tags
}
