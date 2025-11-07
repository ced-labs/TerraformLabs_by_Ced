# Definicion de variables de recursos para modulos

## PRODUCTION

### Variables definidas de entorno del proyecto, zona y region

variable "pro_project_id" {
  description = "ID del proyecto de PRO"
  type        = string
}

variable "pro_project_region" {
  description = "Def. de la region del proyecto de PRO"
  type        = string
}

variable "pro_project_zona" {
  description = "Def. de la zona del proyecto de PRO"
  type        = string
}

### Variables de ejecución

variable "pro_url_source_disk" {
  description = "Trae la URL de los disks de GCP"
  type        = string
}

## PREPRODUCTION

### Variables definidas de entorno del proyecto, zona y region

variable "pre_project_id" {
  description = "ID del proyecto de PRE"
  type        = string
}

variable "pre_project_region" {
  description = "Def. de la region del proyecto de PRE"
  type        = string
}

variable "pre_project_zona" {
  description = "Def. de la zona del proyecto de PRE"
  type        = string
}

