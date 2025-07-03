resource "google_artifact_registry_repository" "app_repo" {
  location      = var.region
  repository_id = "app-repo"
  format        = "DOCKER"
  description   = "Docker repo for app"
}

resource "google_cloud_run_service" "app_service" {
  name     = "my-cloudrun-app"
  location = var.region

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

  traffics {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "public_access" {
  location = google_cloud_run_service.app_service.location
  project  = var.project_id
  service  = google_cloud_run_service.app_service.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
