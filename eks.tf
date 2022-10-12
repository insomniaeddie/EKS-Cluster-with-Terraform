module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version = "17.24.0"
  cluster_name    = local.cluster_name
  cluster_version = "1.22"
  subnets         = module.vpc.private_subnets



  vpc_id = module.vpc.vpc_id

  worker_groups = [
    { name          = "worker-group1"
      instance_type = "t2.micro"

      min_size     = 1
      max_size     = 3
      desired_size = 2

      vpc_security_group_ids = [aws_security_group.worker-group1-sg.id]

    },
    { name          = "worker-group2"
      instance_type = "t2.micro"

      min_size     = 1
      max_size     = 2
      desired_size = 1

      vpc_security_group_ids = [aws_security_group.worker-group2-sg.id]


    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}