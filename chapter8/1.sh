#!/bin/bash

kubectl exec -it curl  bash

ls -l  /var/run/secrets/kubernetes.io/serviceaccount


kubectl create clusterrolebinding permissive-binding  --clusterrole=cluster-admin --group=system:serviceaccounts

TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`

curl -H   "Authorization: Bearer $TOKEN"  --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt   https://10.96.0.1:443


NS =`cat /var/run/secrets/kubernetes.io/serviceaccount/token/namespace`
curl -H   "Authorization: Bearer $TOKEN"  --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt   https://10.96.0.1:443/api/v1/namespaces/$NS/pods



