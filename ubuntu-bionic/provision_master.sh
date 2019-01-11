#!/bin/bash

POD_NETWORK_CIDR=$1

IP=`ip -4 addr show dev enp0s8 | grep inet | awk '{print $2}' | cut -f1 -d/`
HOST_NAME=$(hostname -s)

echo "Executing inside node $HOST_NAME"

echo "Starting kubeadm init"
kubeadm init --apiserver-advertise-address=$IP --apiserver-cert-extra-sans=$IP --node-name $HOST_NAME --pod-network-cidr=$POD_NETWORK_CIDR

echo "Copying admin credendtials to vagrant user"
sudo --user=vagrant mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config

echo "Creating kubeadm token for join"
kubeadm token create --print-join-command >> /bin/kubeadm_join.sh
chmod +x /bin/kubeadm_join.sh

export KUBECONFIG=/etc/kubernetes/admin.conf

sudo mkdir -p /kubeconfig
sudo chmod 777 /kubeconfig
kubectl config view > /kubeconfig/kube.yaml

echo "Configuring aci cni"
kubectl apply -f /home/vagrant/data/aci_deployment.yaml

echo "Done provisioning $HOST_NAME"
