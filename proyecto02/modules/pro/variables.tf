# Variables definidas de entorno del proyecto, zona y region

variable "mod_pro_project_id" {
  description = "ID del proyecto de PRO"
  type        = string
}

variable "mod_pro_project_region" {
  description = "Def. de la region del proyecto de PRO"
  type        = string
}

variable "mod_pro_project_zona" {
  description = "Def. de la zona del proyecto de PRO"
  type        = string
}

variable "mod_pro_url_source_disk" {
  description = "Trae la URL de los disks de GCP"
  type        = string
}