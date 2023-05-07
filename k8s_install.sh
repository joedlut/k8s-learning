#!/bin/bash
#author: joedlut
#date:2023-05-07
########################################################
#     environment ubuntu 22.10                         #
#                                                      #
#                                                      #
########################################################

systemctl stop ufw
systemctl disable ufw

swapoff -a
sed -i '/swap/ s/^/#/g' /etc/fstab

apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y update
sudo apt-get -y install docker-ce

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "registry-mirrors": [
        "https://7mimmp7p.mirror.aliyuncs.com",
        "https://registry.docker-cn.com",
        "http://hub-mirror.c.163.com",
        "https://docker.mirrors.ustc.edu.cn"
        ],
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
      ]
}
EOF

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker

curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

apt install kubeadm=1.22.4-00 kubelet=1.22.4-00 kubectl=1.22.4-00 -y

systemctl start kubelet
systemctl enable kubelet

kubeadm config images list
kubeadm config images pull --image-repository=registry.aliyuncs.com/google_containers

#worker node stop here, replace the ip with the ip of the master node
ip=`ifconfig ens33 | grep broadcast | awk '{print $2}'`
cat <<EOF >>/etc/hosts
$ip k8smaster.example.net
EOF 


##############master node continue########################################
kubeadm init --control-plane-endpoint=k8smaster.example.net  --image-repository=registry.aliyuncs.com/google_containers

export KUBECONFIG=/etc/kubernetes/admin.conf

kubeadm token create --print-join-command

wget https://docs.tigera.io/archive/v3.25/manifests/calico.yaml
sed -i 's/image: docker.io\//image: /g' calico.yaml
kubectl create -f calico.yaml
