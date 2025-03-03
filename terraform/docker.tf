provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Zasób obrazu Docker, który budujemy
resource "docker_image" "my_app_image" {
  name = "my_app:latest"  # Używamy tagu "latest" dla obrazu

  build {
    context = "../app"  # Ścieżka do katalogu, w którym znajduje się Dockerfile
  }
}

# Zasób null_resource do załadowania obrazu do Minikube
resource "null_resource" "minikube_load_image" {
  provisioner "local-exec" {
    command = "sudo -u pawel minikube image load ${docker_image.my_app_image.name}"
  }
}

# Zasób kontenera Docker
resource "docker_container" "my_app_container" {
  name  = "my_app_container"
  image = docker_image.my_app_image.name  # Odwołujemy się do nazwy obrazu

  ports {
    internal = 80
    external = 8080  # Porty, które kontener ma wystawiać na zewnątrz
  }

  # Używamy "env" do ustawienia zmiennych środowiskowych
  env = [
    "SECRET_VALUE=my_secret_value"  # Przykładowa zmienna środowiskowa
  ]
}
