provider "helm" {
  kubernetes {
    host                   = "https://${google_container_cluster.gke-ukl.endpoint}"
    cluster_ca_certificate = "${base64decode(google_container_cluster.gke-ukl.master_auth.0.cluster_ca_certificate)}"
    client_certificate     = "${base64decode(google_container_cluster.gke-ukl.master_auth.0.client_certificate)}"
  }
}

resource "helm_release" "ingress-nginx" {
  name  = "ingress-nginx"
  chart = "ingress-nginx/ingress-nginx"

  set {
    name  = "controller.service.internal.enabled"
    value = "true"
  }

  set {
    name  = "controller.service.internal.annotations.cloud\\.google\\.com/load-balancer-type"
    value = "Internal"
  }


}
