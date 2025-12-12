#!/bin/bash

set -e

# Update system
apt update
apt install -y docker.io


# Start Docker
systemctl start --now docker

# Install K3s
PUBLIC_IP="$(curl -s http://checkip.amazonaws.com)"
curl -sfL https://get.k3s.io \
  | INSTALL_K3S_EXEC="server --tls-san $PUBLIC_IP --node-external-ip $PUBLIC_IP --bind-address 0.0.0.0 --write-kubeconfig-mode 644" sh -

# Wait for K3s to be fully ready 
until k3s kubectl get nodes --no-headers; do
  echo "Waiting for K3s to be ready..."
  sleep 5
done

echo "K3s ready at $PUBLIC_IP:6443"

# Ensure K3s service is running
#systemctl enable --now k3s