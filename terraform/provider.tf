terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.4.2"
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = base64decode(var.gcp_credentials_b64)
}
