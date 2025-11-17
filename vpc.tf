data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.vpc_name

  cidr = "10.6.160.0/23"
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)

  private_subnets = ["10.6.160.0/25", "10.6.160.128/25"]
  public_subnets  = ["10.6.161.0/25", "10.6.161.128/25"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}
