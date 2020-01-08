#!/bin/bash

echo "Deploying CiscoLive Wall Application"

sed -e "s/DBHOST/$HOSTNAME-mysql.csc.richfield.cisco.com/g;s/DBPASS/C1sco123/g;s/DBUSER/predator/g" yaml/weather-deployment-template.yaml > yaml/weather-deployment-ready.yaml
sed -e "s/DBHOST/$HOSTNAME-mysql.csc.richfield.cisco.com/g;s/DBPASS/C1sco123/g;s/DBUSER/predator/g" yaml/event-deployment-template.yaml > yaml/event-deployment-ready.yaml
sed -e "s/DBHOST/$HOSTNAME-mysql.csc.richfield.cisco.com/g;s/DBPASS/C1sco123/g;s/DBUSER/predator/g" yaml/incident-deployment-template.yaml > yaml/incident-deployment-ready.yaml
sed -e "s/DBHOST/$HOSTNAME-mysql.csc.richfield.cisco.com/g;s/DBPASS/C1sco123/g;s/DBUSER/predator/g" yaml/apiserver-deployment-template.yaml > yaml/apiserver-deployment-ready.yaml
sed -e "s/DBHOST/$HOSTNAME-mysql.csc.richfield.cisco.com/g;s/DBPASS/C1sco123/g;s/DBUSER/predator/g" yaml/frontend-deployment-template.yaml > yaml/frontend-deployment-ready.yaml



# Services
kubectl create -f yaml/apiserver-service.yaml
kubectl create -f yaml/frontend-service.yaml

# Deployments
kubectl create -f yaml/weather-deployment-ready.yaml
kubectl create -f yaml/event-deployment-ready.yaml
kubectl create -f yaml/incident-deployment-ready.yaml

sleep 4

kubectl create -f yaml/apiserver-deployment-ready.yaml

sleep 2

kubectl create -f yaml/frontend-deployment-ready.yaml
