module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.0.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = var.private_subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = var.key_name
    }
  }
}
