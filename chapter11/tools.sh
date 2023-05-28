#!/bin/bash

kubectl get pods --watch

kubectl get endpoints kube-scheduler -n kube-system -o yaml
