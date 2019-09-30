#!/bin/bash

location="westeurope"
ResourceGroup="ACI"

ContainerName="goscaleweb"
ContainerImage="woodregistry.azurecr.io/woodgo/goscaleweb"

dnsLabel="go-scale-wood"

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
    --ports 80 \
    --registry-password $ACR_Secret \
    --registry-username $ACR_NAME

sleep 5

az container logs \
    --resource-group $ResourceGroup \
    --name $ContainerName


#az container delete \
#    --resource-group $ResourceGroup \
#    --name $ContainerName
