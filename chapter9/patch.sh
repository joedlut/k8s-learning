#!/bin/bash

kubectl patch deployment kubia -p '{"spec": {"miniReadySeconds": 10}}'
