resource "google_compute_instance" "vm_instance1" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  zone         = "us-west1-a"
  project      = "${var.project}"
  allow_stopping_for_update = true

metadata_startup_script = "curl -fsSL https://get.docker.com/ | sh && sudo systemctl start docker && sudo su -c 'gcloud auth configure-docker --quiet' && sudo su -c 'docker pull gcr.io/my-first-project-310908/docker-app-3:latest' && sudo su -c 'docker run -dp 3000:3000 gcr.io/my-first-project-310908/docker-app-3'"


  boot_disk {
    initialize_params {
      image =   "centos-cloud/centos-7" 
    }
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = "datastoreuser1@my-first-project-310908.iam.gserviceaccount.com" 
    scopes = ["datastore", "storage-full"] //["cloud-platform"] //["datastore", "cloud-source-repos", "storage-full"]
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}