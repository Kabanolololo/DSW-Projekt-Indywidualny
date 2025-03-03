resource "kubernetes_stateful_set" "myapp_db" {
  metadata {
    name      = "myapp-db"
    namespace = "namespace-number1"
  }

  spec {
    service_name = "myapp-db-service"
    replicas     = 1

    selector {
      match_labels = {
        app = "myapp-db"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp-db"
        }
      }

      spec {
        container {
          name  = "myapp-db-container"
          image = "postgres:14"

          port {
            container_port = 5432
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = "MyComplexPassword123!"  # Zmieniona wartość hasła
          }

          volume_mount {
            name       = "data"
            mount_path = "/var/lib/postgresql/data"
          }
        }
      }
    }

    volume_claim_template {
      metadata {
        name = "data"
      }
      spec {
        access_modes = ["ReadWriteOnce"]
        resources {
          requests = {
            storage = "100Mi"
          }
        }
      }
    }
  }
}
