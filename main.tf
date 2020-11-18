terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.9.1"
    }
  }
  backend "remote" {
    organization = "maxlim0"

    workspaces {
      name = "test-ukl"
    }
  }
}


provider "google" {
  credentials = var.SA_TERRAFORM_K8S_TEST_291010
  project     = var.project_name
  region      = var.gcp_zone_eu-west4-a
  zone        = var.gcp_zone_eu-west4-a
}

resource "google_container_cluster" "gke-ukl" {
  name     = "gke-ukl"
  location = var.gcp_zone_eu-west4-a

  network    = google_compute_network.ukl-vpc-test.self_link
  subnetwork = google_compute_subnetwork.ukl-sub-test.self_link

  remove_default_node_pool = false
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }


  node_config {
    preemptible  = true
    machine_type = "e2-small"
    disk_size_gb = 10

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    tags = ["ukl"]

  }
}
