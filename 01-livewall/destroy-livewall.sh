#!/bin/bash

# Services
kubectl delete -f yaml/apiserver-service.yaml
kubectl delete -f yaml/frontend-service.yaml

# Deployments
kubectl delete -f yaml/weather-deployment-ready.yaml
kubectl delete -f yaml/event-deployment-ready.yaml
kubectl delete -f yaml/incident-deployment-ready.yaml
kubectl delete -f yaml/apiserver-deployment-ready.yaml
kubectl delete -f yaml/frontend-deployment-ready.yaml
