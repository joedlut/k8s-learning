#!/bin/bash
kubectl run dnsutils --image=tutum/dnsutils  --command -- sleep infinity

k exec dnsutils nslookup kubia-headless

curl kubia-headless.default.svc.cluster.local:8080
