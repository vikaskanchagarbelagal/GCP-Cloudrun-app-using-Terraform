terraform {
  backend "gcs" {
    bucket      = "ci-cd_pipeline_gcp_bucket" # bucket name
    credentials = "./creds/serviceaccount.json"
  }
}
