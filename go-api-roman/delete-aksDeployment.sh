#!/bin/bash

kubectl delete -f ./config/api.deploy.yaml
kubectl delete -f ./config/api.svc.yaml
