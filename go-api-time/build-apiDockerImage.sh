#!/bin/bash

location="westeurope"
ResourceGroup="WoodKube"

ACR_NAME="woodregistry"


#Create API Dockerfile

az acr build \
    --registry $ACR_NAME . \
    --resource-group $ResourceGroup \
    --image woodgo/gotimeapi


#show Images

az acr repository list \
    --resource-group $ResourceGroup \
    --name $ACR_NAME \
    --output table

