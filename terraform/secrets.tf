resource "kubernetes_secret" "my_secret" {
  metadata {
    name      = "my-secret"
    namespace = "namespace-number1"
  }

  data = {
    SECRET_VALUE = "sekret"
  }

  type = "Opaque"
}
