provider "google" {
  // You can pass an another way to use credentials
  // See here: https://www.terraform.io/docs/providers/google/getting_started.html
  // By default we're using: export GOOGLE_CLOUD_KEYFILE_JSON=path
  project = var.project
  region  = var.gcp["region"]
}
