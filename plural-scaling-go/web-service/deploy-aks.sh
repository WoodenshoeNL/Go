#!/bin/bash

location="westeurope"
ResourceGroup="WoodKube"

ACR_NAME="woodregistry"
ContainerName="woodgo/goscaleweb"


#Create Go Image

#az acr build \
#    --registry $ACR_NAME . \
#    --resource-group $ResourceGroup \
#    --image $ContainerName


kubectl apply -f ./config/api.deploy.yaml

kubectl apply -f ./config/api.svc.yaml
