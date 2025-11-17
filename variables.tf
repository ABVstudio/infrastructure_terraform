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
variable vpc_name{
  type        = string
  default     = "lepseyname_vpc_cluster"
}
