provider "kubernetes" {
}

module "metrics_server" {
  source                                                = "cookielab/metrics-server/kubernetes"
  version                                               = "0.10.0"
  metrics_server_option_kubelet_insecure_tls            = true
  metrics_server_option_kubelet_preferred_address_types = ["InternalIP", "InternalDNS", "Hostname"]
}

