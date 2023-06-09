#!/bin/bash

k taint node k8s-worker-node1 node-type=production:NoSchedule

k taint node k8s-worker-node2 node-type=non-production:NoSchedule --overwrite
