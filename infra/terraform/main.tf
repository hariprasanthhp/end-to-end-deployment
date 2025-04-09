module "vpc" {
  source = "./modules/vpc"
  project = "devops"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source = "./modules/eks"
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_name = "devops-eks-cluster"
  key_name = "your-ec2-key"
}

module "rds" {
  source = "./modules/rds"
  project = "devops"
  private_subnet_ids = module.vpc.private_subnet_ids
  db_username = "admin"
  db_password = "yourpassword"
  security_group_id = module.vpc.default_security_group_id
}

module "ec2" {
  source = "./modules/ec2"
  project = "devops"
  ami_id = "ami-0c55b159cbfafe1f0" # Example Ubuntu AMI
  key_name = "your-ec2-key"
  public_subnet_ids = module.vpc.public_subnet_ids
}
