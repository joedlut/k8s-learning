#!/bin/bash

k taint node k8s-worker-node1 node-type=production:NoSchedule
