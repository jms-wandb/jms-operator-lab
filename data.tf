data "aws_eks_cluster" "app_cluster" {
  name = module.wandb_infra.cluster_id
}

data "aws_eks_cluster_auth" "app_cluster" {
  name = module.wandb_infra.cluster_id
}