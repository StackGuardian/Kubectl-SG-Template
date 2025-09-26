#!/bin/bash
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

# Install k3s with proper IP binding
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --tls-san $PUBLIC_IP --node-external-ip $PUBLIC_IP --bind-address 0.0.0.0" sh -

# Copy kubeconfig and fix server IP
mkdir -p /home/ubuntu/.kube
cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config
sed -i "s/0.0.0.0/$PUBLIC_IP/" /home/ubuntu/.kube/config
chown -R ubuntu:ubuntu /home/ubuntu/.kube
chmod 600 /home/ubuntu/.kube/config