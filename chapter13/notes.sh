#!/bin/bash

kubectl run pod-with-defaults --image alpine --restart Never -- /bin/sleep 99999
