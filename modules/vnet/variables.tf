##== TF OPS ============================
variable "demo_resource_location" {
  description = "The location to deploy instances in"
  default     = "Central US"
}

##== DEMO Resources ========
variable "resource_group_name" {
  description = "kv rsgrp name"
  default = "tf_demo_rg_grp"
}
