#!/bin/bash
kubectl delete ns ingress-nginx &
kubectl get namespace ingress-nginx -o json |jq '.spec = {}' >temp.json
curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/ingress-nginx/finalize
kubectl delete ingressclass nginx
kubectl delete clusterrole ingress-nginx
kubectl delete clusterrolebinding ingress-nginx
kubectl delete validatingwebhookconfiguration ingress-nginx-admission
kubectl delete clusterrole ingress-nginx-admission
kubectl delete clusterrolebinding ingress-nginx-admission
