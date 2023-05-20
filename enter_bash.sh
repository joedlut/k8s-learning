#!/bin/bash
if [ $# -eq 1 ];then
	kubectl exec -it $1  sh
else
	kubectl exec -it $1 -c $2  sh
fi
