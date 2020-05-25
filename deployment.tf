resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = var.namespace
    namespace = var.namespace
    labels = {
      app = var.namespace
    }
  }

  spec {
    replicas = 10

    selector {
      match_labels = {
        app = var.namespace
      }
    }

    template {
      metadata {
        labels = {
          app = var.namespace
        }
      }

      spec {
        priority_class_name = "high-priority"
        container {
          image = "975128513215.dkr.ecr.ap-southeast-1.amazonaws.com/nodejs-test:latest"
          name  = var.namespace
          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

