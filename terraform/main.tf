resource "google_cloud_run_service" "app_service" {
  name     = "my-cloudrun-service"
  location = var.region
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.docker_image_url

        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  location = google_cloud_run_service.app_service.location
  project  = var.project_id
  service  = google_cloud_run_service.app_service.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
