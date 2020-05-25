resource "kubernetes_priority_class" "priority" {
  metadata {
    name = "high-priority"
  }

  value = 100
}

