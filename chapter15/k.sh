#!/bin/bash
kubectl autoscale deployment kubia --cpu-percent=30 --min=1 --max=5
k get hpa

kubectl describe hpa

kubectl expose deployment kubia --port=80 --target-port=8080



# 终端一
watch -n 1 kubectl get hpa,deployment

# 终端二 模拟压测
kubectl run -it --rm --restart=Never loadgenerator --image=busybox -- sh -c "while true;do wget -O - -q http://kubia.default;done"
