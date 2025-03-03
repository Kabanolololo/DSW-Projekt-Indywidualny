resource "kubernetes_namespace" "namespace_number1" {
  metadata {
    name = "namespace-number1"
  }
}

resource "kubernetes_namespace" "namespace_number2" {
  metadata {
    name = "namespace-number2"
  }
}
