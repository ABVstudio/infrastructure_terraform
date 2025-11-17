variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "owner" {
  description = "Owner"
  type        = string
  default     = "lepseyname"
}
variable "cluster_name"{
  type        = string
  default     = "lepseyname_cluster"
}
variable cluster_node_name{ 
  default     = "nodes_one"
}
variable cluster_node_prefix{
  default     = "nodes_one_"
}
variable vpc_name{
  type        = string
  default     = "lepseyname_vpc_cluster"
}
variable "repository_name"{
  type        = string
  default     = "lepsey_repository"
}
variable "repository_iam_full"{
  type        = string
  default     = "arn:aws:iam::443370672158:user/lepseyname"
}
