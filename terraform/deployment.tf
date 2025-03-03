resource "kubernetes_deployment" "app" {
  metadata {
    name      = "app-deployment"
    namespace = "namespace-number1"
    labels = {
      app = "my-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "my-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          name  = "my-app-container"
          image = "todo-app"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "100Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "100Mi"
            }
          }

          env_from {
            config_map_ref {
              name = kubernetes_config_map.app_config.metadata[0].name
            }
          }

          env {
            name = "SECRET_VALUE"
            value_from {
              secret_key_ref {
                name = "my-secret"
                key  = "SECRET_VALUE"
              }
            }
          }
        }
      }
    }
  }
}
