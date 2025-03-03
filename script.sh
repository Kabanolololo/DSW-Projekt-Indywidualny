#!/bin/bash

# Uruchamiamy Minikube jako zwykły użytkownik
echo "Starting Minikube..."
minikube start --driver=docker


echo "Enabling Minikube Ingress addon..."
minikube addons enable ingress

# Przechodzimy do katalogu 'app'
cd app

# Konfigurujemy kubectl do używania kontekstu Minikube
echo "Setting kubectl context to Minikube..."
kubectl config use-context minikube

# Konfigurujemy środowisko Docker Minikube
echo "Setting up Minikube Docker environment..."
eval $(minikube docker-env)

# Budujemy obraz Docker
echo "Building Docker image for todo-app..."
docker build -t todo-app .

# Wracamy do katalogu głównego
cd ..

# Przechodzimy do katalogu 'terraform'
cd terraform

# Inicjalizujemy Terraform jako root
echo "Initializing Terraform..."
sudo terraform init

# Aplikujemy Terraform
echo "Applying Terraform..."
sudo terraform apply -auto-approve

echo "Skrypt zakończony!"
