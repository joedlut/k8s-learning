查看滚动升级状态
kubectl rollout status deployment kubia

回滚
kubectl rollout undo deployment kubia

查看升级历史
kubectl  rollout history deployment kubia

回滚到某个版本
kubectl rollout undo deployment kubia --to-revision=6

暂停升级
kubectl rollout pause deployment kubia

继续升级
kubectl rollout resume deployment kubia
