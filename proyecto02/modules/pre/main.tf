# Creación de disco

## From snapshot de disco: srv01

resource "google_compute_disk" "disk_from_snapshot_srv01_data_to_pre" {
  name    = "disk-srv01-data-from-prod"
  type    = "pd-standard"
  zone    = var.mod_pre_project_zona
  project = var.mod_pre_project_id

  snapshot = var.mod_pre_self_link_snapshot_srv01_data
}

# Attach de discos

## Attach del disco: srv01 a la MV

resource "google_compute_attached_disk" "attach_disk_from_snapshot_srv01_data_to_pre" {
  disk       = google_compute_disk.disk_from_snapshot_srv01_data_to_pre.id
  instance   = "presrv01"
  zone       = var.mod_pre_project_zona
  project    = var.mod_pre_project_id
  mode       = "READ_WRITE"
  depends_on = [google_compute_disk.disk_from_snapshot_srv01_data_to_pre]
}