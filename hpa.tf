resource "kubernetes_horizontal_pod_autoscaler" "hpa" {
  metadata {
    name      = var.namespace
    namespace = var.namespace
  }

  spec {
    min_replicas = 7
    max_replicas = 10

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = var.namespace
    }

    metric {
      type = "Resource"
      resource {
        name = "memory"
        target {
          type                = "Utilization"
          average_utilization = 60
        }
      }
    }
    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type                = "Utilization"
          average_utilization = 50
        }
      }
    }
  }
}

