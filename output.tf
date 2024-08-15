output "url" {
  value = module.wandb_infra.url
}

output "bucket_name" {
  value = module.wandb_infra.bucket_name
}

output "bucket_queue_name" {
  value = module.wandb_infra.bucket_queue_name
}

output "database_instance_type" {
  value = module.wandb_infra.database_instance_type
}

output "eks_node_instance_type" {
  value = module.wandb_infra.eks_node_instance_type
}

output "redis_instance_type" {
  value = module.wandb_infra.redis_instance_type
}

output "standardized_size" {
  value = var.size
}
