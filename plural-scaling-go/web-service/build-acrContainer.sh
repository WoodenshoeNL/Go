#!/bin/bash

location="westeurope"
ResourceGroup="WoodKube"

ACR_NAME="woodregistry"
ContainerName="woodgo/goscaleweb"


#Create Go Image

az acr build \
    --registry $ACR_NAME . \
    --resource-group $ResourceGroup \
    --image $ContainerName

#show Images

az acr repository list \
    --resource-group $ResourceGroup \
    --name $ACR_NAME \
    --output table
