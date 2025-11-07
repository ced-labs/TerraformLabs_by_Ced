# PRODUCTION

module "pro" {
  source                  = "./modules/pro"
  mod_pro_project_id      = var.pro_project_id
  mod_pro_project_region  = var.pro_project_region
  mod_pro_project_zona    = var.pro_project_zona
  mod_pro_url_source_disk = var.pro_url_source_disk
}

# PREPRODUCTION

module "pre" {
  source                                            = "./modules/pre"
  depends_on                                        = [module.pro]
  mod_pre_project_id                                = var.pre_project_id
  mod_pre_project_region                            = var.pre_project_region
  mod_pre_project_zona                              = var.pre_project_zona
  mod_pre_self_link_snapshot_srv01_data             = module.pro.self_link_snapshot_srv01_data
}
