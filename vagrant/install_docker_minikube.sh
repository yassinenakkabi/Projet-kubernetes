#!/bin/bash
set -e

echo "🚀 Mise à jour du système..."
sudo apt update -y && sudo apt upgrade -y

echo "🐳 Installation de Docker..."
sudo apt install -y ca-certificates curl gnupg lsb-release

# Ajouter la clé GPG officielle de Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Ajouter le dépôt Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installer Docker
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Activer Docker sans sudo
sudo usermod -aG docker $USER
newgrp docker

echo "✅ Docker installé avec succès !"
docker --version

# -------------------------------------------------------------------

echo "📦 Installation de kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
kubectl version --client
echo "✅ kubectl installé avec succès !"

# -------------------------------------------------------------------

echo "🚀 Installation de Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
minikube version
echo "✅ Minikube installé avec succès !"

# -------------------------------------------------------------------

echo "⚙️ Démarrage de Minikube avec Docker comme driver..."
minikube start --driver=docker

echo "🎉 Installation terminée avec succès !"
echo "👉 Vérifie l'état avec : kubectl get nodes"
