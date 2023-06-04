#!/bin/bash

kubeadm init --control-plane-endpoint=k8smaster.example.net  --image-repository=registry.aliyuncs.com/google_containers
