variable "namespace" {
  type        = string
  description = "Name prefix used for resources"
}

variable "domain_name" {
  type        = string
  description = "Domain name used to access instance."
}

variable "aws_profile" {
  type        = string
  description = "AWS profile for auth"
  default     = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "zone_id" {
  type        = string
  description = "Id of Route53 zone"
}

variable "size" {
  default     = "small"
  description = "Deployment size"
  nullable    = true
  type        = string
}

variable "subdomain" {
  type        = string
  default     = null
  description = "Subdomain for accessing the Weights & Biases UI."
}

variable "wandb_license" {
  type = string
}

variable "database_engine_version" {
  description = "Version for MySQL Auora"
  type        = string
  default     = "8.0.mysql_aurora.3.02.2"
}

variable "database_instance_class" {
  description = "Instance type to use by database master instance."
  type        = string
  default     = "db.r5.large"
}

variable "database_snapshot_identifier" {
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
  type        = string
  default     = null
}

variable "database_sort_buffer_size" {
  description = "Specifies the sort_buffer_size value to set for the database"
  type        = number
  default     = 262144
}

variable "wandb_version" {
  description = "The version of Weights & Biases local to deploy."
  type        = string
  default     = "latest"
}

variable "wandb_image" {
  description = "Docker repository of to pull the wandb image from."
  type        = string
  default     = "wandb/local"
}

variable "bucket_name" {
  type    = string
  default = ""
}

variable "bucket_kms_key_arn" {
  type        = string
  description = "The Amazon Resource Name of the KMS key with which S3 storage bucket objects will be encrypted."
  default     = ""
}

variable "allowed_inbound_cidr" {
  default  = ["0.0.0.0/0"]
  nullable = false
  type     = list(string)
}

variable "allowed_inbound_ipv6_cidr" {
  default  = ["::/0"]
  nullable = false
  type     = list(string)
}

variable "other_wandb_env" {
  type        = map(string)
  description = "Extra environment variables for W&B"
  default = {}
}

variable "system_reserved_cpu_millicores" {
  description = "(Optional) The amount of 'system-reserved' CPU millicores to pass to the kubelet. For example: 100.  A value of -1 disables the flag."
  type        = number
  default     = -1
}

variable "system_reserved_memory_megabytes" {
  description = "(Optional) The amount of 'system-reserved' memory in megabytes to pass to the kubelet. For example: 100.  A value of -1 disables the flag."
  type        = number
  default     = -1
}

variable "system_reserved_ephemeral_megabytes" {
  description = "(Optional) The amount of 'system-reserved' ephemeral storage in megabytes to pass to the kubelet. For example: 1000.  A value of -1 disables the flag."
  type        = number
  default     = -1
}

variable "system_reserved_pid" {
  description = "(Optional) The amount of 'system-reserved' process ids [pid] to pass to the kubelet. For example: 1000.  A value of -1 disables the flag."
  type        = number
  default     = -1
}

variable "aws_loadbalancer_controller_tags" {
  description = "(Optional) A map of AWS tags to apply to all resources managed by the load balancer controller"
  type        = map(string)
  default     = {}
}

variable "private_link_allowed_account_ids" {
  description = "List of AWS account IDs allowed to access the VPC Endpoint Service"
  type        = list(string)
  default     = []
}

variable "eks_cluster_version" {
  description = "Version of EKS to deploy"
  type = string
  default = "1.32"
}

##########################################
# EKS Cluster Addons                     #
##########################################
variable "eks_addon_efs_csi_driver_version" {
  description = "The version of the EFS CSI driver to install. Check the docs for more information about the compatibility https://docs.aws.amazon.com/eks/latest/userguide/vpc-add-on-update.html."
  type        = string
  default     = "v2.0.7-eksbuild.1"
}

variable "eks_addon_ebs_csi_driver_version" {
  description = "The version of the EBS CSI driver to install. Check the docs for more information about the compatibility https://docs.aws.amazon.com/eks/latest/userguide/vpc-add-on-update.html."
  type        = string
  default     = "v1.35.0-eksbuild.1"
}

variable "eks_addon_coredns_version" {
  description = "The version of the CoreDNS addon to install. Check the docs for more information about the compatibility https://docs.aws.amazon.com/eks/latest/userguide/vpc-add-on-update.html."
  type        = string
  default     = "v1.11.3-eksbuild.2"
}

variable "eks_addon_kube_proxy_version" {
  description = "The version of the kube-proxy addon to install. Check the docs for more information about the compatibility https://docs.aws.amazon.com/eks/latest/userguide/vpc-add-on-update.html."
  type        = string
  default     = "v1.32.0-eksbuild.2"
}

variable "eks_addon_vpc_cni_version" {
  description = "The version of the VPC CNI addon to install. Check the docs for more information about the compatibility https://docs.aws.amazon.com/eks/latest/userguide/vpc-add-on-update.html.s"
  type        = string
  default     = "v1.19.2-eksbuild.1"
}

variable "eks_addon_metrics_server_version" {
  description = "The version of the metrics-server addon to install. Check compatibility with `aws eks describe-addon-versions --region $REGION --kubernetes-version $EKS_CLUSTER_VERSION`"
  type        = string
  default     = "v0.7.2-eksbuild.1"
}

# ##########################################
# # Operator                               #
# ##########################################
# variable "operator_chart_version" {
#   type        = string
#   description = "Version of the operator chart to deploy"
#   default     = "1.4.0"
# }

# variable "controller_image_tag" {
#   type        = string
#   description = "Tag of the controller image to deploy"
#   default     = "1.18.5"
# }

# variable "enable_helm_release" {
#   type        = bool
#   default     = true
#   description = "Enable or disable applying and releasing Helm chart"
# }
