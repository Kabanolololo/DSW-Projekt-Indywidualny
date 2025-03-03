resource "kubernetes_config_map" "app_config" {
  metadata {
    name      = "app-config"
    namespace = "namespace-number1"  # Zmieniamy na odpowiedni namespace
  }

  data = {
    APP_NAME        = "my-app"
    APP_MODE        = "production"
    LOG_LEVEL       = "info"
    MAX_CONNECTIONS = "100"
    CACHE_TIMEOUT   = "300"
    CONTAINER_PORT  = "80"  # Port kontenera
    DB_PORT         = "5432"  # Port dla bazy danych
  }
}
