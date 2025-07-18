 locals {
   other_envs = {
    # "GORILLA_CORS_ORIGINS" = "https://jms-op-lab1.jms.wandb.ml, null"
    # "OIDC_ISSUER"      = var.oidc_issuer_url
    # "OIDC_CLIENT_ID"   = okta_app_oauth.wandb.client_id
    # "OIDC_AUTH_METHOD" = "pkce"
    "ENABLE_REGISTRY_UI" = true
    # "GORILLA_CORS_ORIGINS" = "https://jms-op-lab1.jms.wandb.ml, null"
    #   "GORILLA_USE_IDENTIFIER_CLAIMS" = true
      #  "GORILLA_CORS_ORIGINS"          = "https://${module.wandb_infra.url}, null"
  }
  env_vars = merge(
    local.other_envs,
    var.other_wandb_env,
  )
}

module "wandb_infra" {
  source  = "wandb/wandb/aws"
  version = "7.12.3"

  license              = var.wandb_license
  namespace            = var.namespace
  public_access        = true
  external_dns         = true
  # enable_dummy_dns     = true
  # enable_operator_alb  = true
  custom_domain_filter = var.domain_name

  other_wandb_env = local.env_vars

  private_link_allowed_account_ids = var.private_link_allowed_account_ids

  # operator_chart_version = var.operator_chart_version
  # controller_image_tag   = var.controller_image_tag
  # enable_helm_release    = var.enable_helm_release

  deletion_protection            = false
  # database_instance_class        = var.database_instance_class
  # database_engine_version        = var.database_engine_version
  # database_snapshot_identifier   = var.database_snapshot_identifier
  # database_sort_buffer_size      = var.database_sort_buffer_size
  allowed_inbound_cidr           = var.allowed_inbound_cidr
  allowed_inbound_ipv6_cidr      = var.allowed_inbound_ipv6_cidr
  kubernetes_public_access       = true
  kubernetes_public_access_cidrs = ["0.0.0.0/0"]
  domain_name                    = var.domain_name
  zone_id                        = var.zone_id
  subdomain                      = var.subdomain
  # bucket_name                         = var.bucket_name
  # bucket_kms_key_arn                  = var.bucket_kms_key_arn
  use_internal_queue                  = true
  size                                = var.size
  # system_reserved_cpu_millicores      = var.system_reserved_cpu_millicores
  # system_reserved_memory_megabytes    = var.system_reserved_memory_megabytes
  # system_reserved_ephemeral_megabytes = var.system_reserved_ephemeral_megabytes
  # system_reserved_pid                 = var.system_reserved_pid
  # aws_loadbalancer_controller_tags    = var.aws_loadbalancer_controller_tags

  eks_cluster_version            = var.eks_cluster_version
  
  eks_addon_efs_csi_driver_version = var.eks_addon_efs_csi_driver_version
  eks_addon_ebs_csi_driver_version = var.eks_addon_ebs_csi_driver_version
  eks_addon_coredns_version        = var.eks_addon_coredns_version
  eks_addon_kube_proxy_version     = var.eks_addon_kube_proxy_version
  eks_addon_vpc_cni_version        = var.eks_addon_vpc_cni_version
  eks_addon_metrics_server_version = var.eks_addon_metrics_server_version

  create_elasticache = var.create_elasticache
  elasticache_node_type = var.elasticache_node_type
}
