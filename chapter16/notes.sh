#!/bin/bash

k taint node k8s-worker-node1 node-type=production:NoSchedule

k taint node k8s-worker-node2 node-type=non-production:NoSchedule --overwrite

#去掉污点
k taint node  k8s-worker-node2 node-type=non-production:NoSchedule-

kubectl run backend -l app=backend --image busybox -- sleep 999999
