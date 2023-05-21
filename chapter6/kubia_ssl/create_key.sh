#!/bin/bash
kubectl create secret generic fortune-https --from-file=httpd.crt --from-file=httpd.key --from-file=foo
