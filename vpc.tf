resource "google_compute_network" "ukl-vpc-test" {
  name                    = var.vpc_name
  project                 = var.project_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}


resource "google_compute_subnetwork" "ukl-sub-test" {
  name          = var.subnet_name
  ip_cidr_range = "192.168.0.0/24"
  region        = var.gcp_region_eu-west4
  network       = google_compute_network.ukl-vpc-test.self_link

  secondary_ip_range {
    range_name    = "ukl-sub-range-1"
    ip_cidr_range = "192.168.1.0/24"
  }

  secondary_ip_range {
    range_name    = "ukl-sub-range-2"
    ip_cidr_range = "192.168.2.0/24"
  }
}


