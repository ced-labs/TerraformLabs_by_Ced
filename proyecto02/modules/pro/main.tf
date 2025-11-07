# Creación de TimeStamp

locals {
  clean_time = formatdate("YYYY-MM-DD-HHmm", timestamp())
}

resource "null_resource" "time_trigger" {
  triggers = {
    always_run = local.clean_time
  }
}

# Creación de snapshots

## Disco: srv01-data

resource "google_compute_snapshot" "snapshot_srv01_data" {
  name        = "snapshot-srv01-data-${null_resource.time_trigger.triggers.always_run}"
  project     = var.mod_pro_project_id
  source_disk = "${var.mod_pro_url_source_disk}/srv01-data
}

# Compartir snapshots

## Snapshot de srv01-data


resource "google_compute_snapshot_iam_member" "shared_snapshot_srv01_data" {
  name    = google_compute_snapshot.snapshot_srv01_data.name
  project = var.mod_pro_project_id
  role    = "roles/compute.storageAdmin"
  member  = "serviceAccount:terraform-service-account@production.iam.gserviceaccount.com"

  depends_on = [google_compute_snapshot.snapshot_srv01_data]
}