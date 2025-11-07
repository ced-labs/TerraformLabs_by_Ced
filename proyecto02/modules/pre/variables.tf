# Variables definidas de entorno del proyecto, zona y region

variable "mod_pre_project_id" {
  description = "ID del proyecto de PRE"
  type        = string
}

variable "mod_pre_project_region" {
  description = "Def. de la region del proyecto de PRE"
  type        = string
}

variable "mod_pre_project_zona" {
  description = "Def. de la zona del proyecto de PRE"
  type        = string
}

variable "mod_pre_self_link_snapshot_srv01_data" {
  description = "Obtiene la URL de la Snapshot"
  type        = string
}