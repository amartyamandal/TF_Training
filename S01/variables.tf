
##=== TF OPS SPN =====
variable "azurerm_subscription_id" {
  description = "azure subscription id"
  default     = "<>"
}

variable "azurerm_tenant_id" {
  description = "azure tenant id"
  default     = "<>"
}

variable "azurerm_client_id" {
  description = "azure client id"
  default     = "<>"
}

variable "azurerm_client_secret" {
  description = "azure spn secret"
  default     = "<>"
}

##== TF OPS ============================
variable "demo_resource_location" {
  description = "The location to deploy instances in"
  default     = "Central US"
}

variable "kv_name" {
  description = "kv name"
  default     = <>"
}

variable "kv_rsgrp_name" {
  description = "kv rsgrp name"
  default     = "terraformstate"
}

variable "sshkey_name" {
  description = "sshkey name"
  default     = "sshkey"
}

##== DEMO Resources ========
variable "resource_group_name" {
  description = "kv rsgrp name"
  default     = "tf_demo_rg_grp"
}
### VM =========================



