resource "kubernetes_service" "service" {
  metadata {
    name      = var.namespace
    namespace = var.namespace
  }
  spec {
    selector = {
      app = var.namespace
    }
    session_affinity = "None"
    port {
      port        = 3000
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}

output "elb" {
  value       = kubernetes_service.service.load_balancer_ingress[0].hostname
  description = "classic loadbancer dns name"
}

