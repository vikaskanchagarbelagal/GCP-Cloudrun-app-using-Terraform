variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region for Cloud Run"
  type        = string
}

variable "docker_image_url" {
  description = "The full Docker image URL in Artifact Registry"
  type        = string
}

variable "gcp_credentials_b64" {
  description = "Base64 encoded GCP service account JSON key"
  type        = string
}
