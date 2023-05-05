#!/bin/bash
kubeadm reset
rm -fr ~/.kube/  /etc/kubernetes/* var/lib/etcd/*
