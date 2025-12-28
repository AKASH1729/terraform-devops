module "eks" {

    #import the EKS module from the Terraform Registry
  source  = "terraform-aws-modules/eks/aws"
  


#cluster info(for control plane)
  cluster_name                   = local.name
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  #this is specific for control plane network
  control_plane_subnet_ids = module.vpc.intra_subnets # Control plane in intra subnets 

  # EKS Managed Node Group(s) 

  eks_managed_node_group_defaults = {

    instance_types = ["t3.medium"]

    attach_cluster_primary_security_group = true

  }


  eks_managed_node_groups = {

    bankapp-ng = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"

      tags = {
        ExtraTag = "MyCluster"
      }
    }
  }

 


}