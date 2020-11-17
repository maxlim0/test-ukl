resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.ukl-vpc-test.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["1-65534"]
  }

  source_tags = ["ukl"]
}
