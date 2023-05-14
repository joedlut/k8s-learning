推送或者拉取镜像的机器上 /etc/docker/daemon.json添加 并且重启docker 才可以推送或者拉取

 "insecure-registries": ["192.168.88.138:80"]

for example

root@joedlut-virtual-machine:/home/joedlut/k8s-learning/harbor# cat /etc/docker/daemon.json 
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
  ],
  "insecure-registries": ["192.168.88.138:80"]
}

