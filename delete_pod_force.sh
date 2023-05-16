#!/bin/bash
kubectl delete pod $1 --force --grace-period=0
