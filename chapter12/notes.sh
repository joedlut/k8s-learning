#!/bin/bash

kubectl get sa

kubectl create serviceaccount fo

# 启用RBAC
kubectl delete clusterrolebinding permissive-binding o


kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=2532771263@qq.com


#通过命令行创建角色
kubectl create role service-reader --verb=get --verb=list --resource=services -n bar

#绑定role到 serviceaccount上
kubectl create rolebinding test --role=service-reader --serviceaccount=foo:default -n foo

#命令修改rolebinding 
 k edit rolebinding test -n foo
