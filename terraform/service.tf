resource "kubernetes_service" "app_service" {
  metadata {
    name      = "app-service"
    namespace = "namespace-number1"
  }

  spec {
    selector = {
      app = "my-app"
    }

    dynamic "port" {
      for_each = var.service_ports
      content {
        name        = "port-${port.key}"  # Unikalna nazwa dla każdego portu
        port        = port.value.port
        target_port = port.value.target_port
      }
    }

    type = "NodePort"
  }
}
