#!/bin/bash

location="westeurope"
ResourceGroup="ACI"

ContainerName="gorouter"
ContainerImage="woodregistry.azurecr.io/woodgo/gorouter"

dnsLabel="go-router-wood"

ACR_ResourceGroup="WoodKube"
ACR_NAME="woodregistry"
ACR_Secret=$(az acr credential show \
    --name $ACR_NAME \
    --resource-group $ACR_ResourceGroup \
    --query "passwords[0].value" \
    --output tsv)


az container create \
    --resource-group $ResourceGroup \
    --name $ContainerName \
    --image $ContainerImage \
    --dns-name-label $dnsLabel \
    --ports 8000 \
    --registry-password $ACR_Secret \
    --registry-username $ACR_NAME

sleep 5

az container logs \
    --resource-group $ResourceGroup \
    --name $ContainerName


#az container delete \
#    --resource-group $ResourceGroup \
#    --name $ContainerName
