# Ingress aplikacji
resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name      = "app-ingress"
    namespace = "namespace-number1" # Dodajemy namespace, możesz zmienić na inny
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      host = "todo-app.local"  # Zmieniono na nową nazwę hosta

      http {
        path {
          path     = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "app-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
