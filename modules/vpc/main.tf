
# module "vpc" {
#   source  = "terraform-google-modules/network/google"
#   version = "0.6.0"

#   project_id   = "${var.project}"
#   network_name = "${var.env}"

#   subnets = [
#     {
#       subnet_name   = "${var.env}-subnet-01"
#       subnet_ip     = "10.${var.env == "dev" ? 10 : 20}.10.0/24"
#       subnet_region = "us-west1"
#       subnet_flow_logs      = "false"
#     },
#   ]

#   secondary_ranges = {
#     "${var.env}-subnet-01" = []
#   }
# }
