# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" {}

provider "kubectl" {
  load_config_file       = false
  host                   = "https://${google_container_cluster.gke-ukl.endpoint}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.gke-ukl.master_auth.0.cluster_ca_certificate)}"
  token = data.google_client_config.provider.access_token
}

resource "kubectl_manifest" "create-ns-infra" {
    yaml_body   = file("ns-infra.yml")
}
