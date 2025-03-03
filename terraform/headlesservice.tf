resource "kubernetes_service" "myapp_db_service" {
  metadata {
    name      = "myapp-db-service"
    namespace = "namespace-number1"  # Zmienione na aktualnie używaną nazwę namespace
  }

  spec {
    cluster_ip = "None"
    selector = {
      app = "myapp-db"  # Zmieniona nazwa aplikacji
    }

    port {
      port        = 5432
      target_port = 5432
    }
  }
}
