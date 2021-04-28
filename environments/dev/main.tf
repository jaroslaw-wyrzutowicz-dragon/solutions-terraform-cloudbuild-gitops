locals {
  env = "dev"
}

provider "google" {
  project = "${var.project}"
}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}


resource "google_datastore_index" "default" {
  kind = "kind-test-5"
  properties {
    name = "property_a"
    direction = "ASCENDING"
  }
  properties {
    name = "property_b"
    direction = "ASCENDING"
  }
}

#   resource "google_compute_instance" "vm_instance1" {
#   name         = "terraform-instance"
#   machine_type = "f1-micro"
#   zone         = "us-central1-a"
#   allow_stopping_for_update = true

# metadata_startup_script = "curl -fsSL https://get.docker.com/ | sh && sudo systemctl start docker && sudo su -c 'gcloud auth configure-docker --quiet' && sudo su -c 'docker pull gcr.io/my-first-project-310908/docker-app-3:latest' && sudo su -c 'docker run -dp 3000:3000 gcr.io/my-first-project-310908/docker-app-3'"
# # apt-get update && sudo apt-get install apache2 -y && echo '<html><body><h1>Environment: ${local.network}</h1></body></html>' | sudo tee /var/www/html/index.html"

#   boot_disk {
#     initialize_params {
#       image = /*"debian-cloud/debian-10" */  "centos-cloud/centos-7" //"cos-cloud/cos-stable"
#     }
#   }

service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = "datastoreuser1@my-first-project-310908.iam.gserviceaccount.com" 
    scopes = ["datastore", "storage-full"] //["cloud-platform"] //["datastore", "cloud-source-repos", "storage-full"]
  }

#   network_interface {
#     # A default network is created for all GCP projects
#     network = "default"
#     access_config {
#     }
#   }
# }

module "vm_instance" {
  source  = "../../modules/vm_instance"
  project = "${var.project}"
  # subnet  = "${module.vpc.subnet}"
}


# module "vpc" {
#   source  = "../../modules/vpc"
#   project = "${var.project}"
#   env     = "${local.env}"
# }

# module "http_server" {
#   source  = "../../modules/http_server"
#   project = "${var.project}"
#   subnet  = "${module.vpc.subnet}"
# }

# module "firewall" {
#   source  = "../../modules/firewall"
#   project = "${var.project}"
#   # subnet  = "${module.vpc.subnet}"
# }