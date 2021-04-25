
terraform {
  backend "gcs" {
    bucket = "my-first-project-310908-tfstate"
    prefix = "env/dev"
  }
}
