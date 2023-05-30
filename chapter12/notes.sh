#!/bin/bash

kubectl get sa

kubectl create serviceaccount fo

# 启用RBAC
kubectl delete clusterrolebinding permissive-binding

#禁用RBAC
kubectl create clusterrolebinding permissive-binding  --clusterrole=cluster-admin --group=system:serviceaccounts



kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=2532771263@qq.com


#通过命令行创建角色
kubectl create role service-reader --verb=get --verb=list --resource=services -n bar

#绑定role到 serviceaccount上
kubectl create rolebinding test --role=service-reader --serviceaccount=foo:default -n foo

#命令修改rolebinding 
 k edit rolebinding test -n foo


kubectl create clusterrole pv-reader --verb=get,list --resource=persistentvolumes

#错误
kubectl create rolebinding pv-test --clusterrole=pv-reader --serviceaccount=foo:default -n foo
#正确
kubectl create clusterrolebinding pv-test --clusterrole=pv-reader --serviceaccount=foo:default 

kubectl get clusterrole system:discovery -o yaml

k get clusterrole view -o yaml

kubectl create clusterrolebinding view-test --clusterrole=view --serviceaccount=foo:default


k delete clusterrolebinding view-test
k create rolebinding view-test --clusterrole=view --serviceaccount=foo:default -n foo

k get clusterrolebindings
k get clusterroles
