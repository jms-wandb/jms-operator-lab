module "wandb_infra" {
  source  = "wandb/wandb/aws"
  version = "5.1.0"

  license              = var.wandb_license
  namespace            = var.namespace
  public_access        = true
  external_dns         = true
  enable_dummy_dns     = true
  enable_operator_alb  = true
  custom_domain_filter = var.domain_name

  # other_wandb_env = merge({
  #   "ENABLE_REGISTRY_UI" : "true",
  #   "GORILLA_CORS_ORIGINS": "https://jms-op-lab1.jms.wandb.ml\\,null"
  # }, var.other_wandb_env)

  deletion_protection            = false
  database_instance_class        = var.database_instance_class
  database_engine_version        = var.database_engine_version
  database_snapshot_identifier   = var.database_snapshot_identifier
  database_sort_buffer_size      = var.database_sort_buffer_size
  allowed_inbound_cidr           = var.allowed_inbound_cidr
  allowed_inbound_ipv6_cidr      = ["::/0"]
  eks_cluster_version            = "1.28"
  kubernetes_public_access       = true
  kubernetes_public_access_cidrs = ["0.0.0.0/0"]
  domain_name                    = var.domain_name
  zone_id                        = var.zone_id
  subdomain                      = var.subdomain
  bucket_name                         = var.bucket_name
  bucket_kms_key_arn                  = var.bucket_kms_key_arn
  use_internal_queue                  = true
  size                                = var.size
  system_reserved_cpu_millicores      = var.system_reserved_cpu_millicores
  system_reserved_memory_megabytes    = var.system_reserved_memory_megabytes
  system_reserved_ephemeral_megabytes = var.system_reserved_ephemeral_megabytes
  system_reserved_pid                 = var.system_reserved_pid
  aws_loadbalancer_controller_tags    = var.aws_loadbalancer_controller_tags
}
