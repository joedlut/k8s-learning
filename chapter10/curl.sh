#!/bin/bash
curl 127.0.0.1:8001/api/v1/namespaces/default/services/kubia-public/proxy/
curl 127.0.0.1:8001/api/v1/namespaces/default/pods/kubia-0/proxy/
curl 127.0.0.1:8001/api/v1/namespaces/default/pods/kubia-1/proxy/
