#!/bin/bash
kubectl create configmap fortune-config --from-literal=sleep-interval=25
