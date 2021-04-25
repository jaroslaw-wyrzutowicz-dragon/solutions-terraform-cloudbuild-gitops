locals {
  "env" = "dev"
}

provider "google" {
  project = "${var.project}"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = "${var.project}"
  env     = "${local.env}"
}

module "http_server" {
  source  = "../../modules/http_server"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}

module "firewall" {
  source  = "../../modules/firewall"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}


# resource "google_datastore_index" "default" {
#   kind = "kind-test-1"
#   properties {
#     name = "property_a"
#     direction = "ASCENDING"
#   }
#   properties {
#     name = "property_b"
#     direction = "ASCENDING"
#   }
# }

  # resource "google_compute_instance" "vm_instance1" {
  # name         = "terraform-instance"
  # machine_type = "f1-micro"

  # boot_disk {
  #   initialize_params {
  #     image = "debian-cloud/debian-9"
  #   }
  # }

#   network_interface {
#     # A default network is created for all GCP projects
#     network = "default"
#     access_config {
#     }
#   }
# }

