terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"
    }

    minikube = {
      source  = "scott-the-programmer/minikube"
      version = ">= 0.2.0"
    }
  }
}

# Konfiguracja dostawcy Kubernetes
provider "kubernetes" {
  host                   = "https://192.168.49.2:8443"  # IP Twojego Minikube
  cluster_ca_certificate = file("/home/pawel/.minikube/ca.crt")
  client_certificate     = file("/home/pawel/.minikube/profiles/minikube/client.crt")
  client_key             = file("/home/pawel/.minikube/profiles/minikube/client.key")
}
