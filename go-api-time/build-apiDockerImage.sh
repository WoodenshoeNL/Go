#!/bin/bash

location="westeurope"
ResourceGroup="WoodKube"

ACR_NAME="woodregistry"

#Create API Dockerfile

az acr build \
    --registry $ACR_NAME https://github.com/WoodenshoeNL/Go.git \
    --resource-group $ResourceGroup \
    --file go-api-time/dockerfile \
    --image woodgo/gotimeapi


#show Images

az acr repository list \
    --resource-group $ResourceGroup \
    --name $ACR_NAME \
    --output table



#az acr build \
#    --registry $ACR_NAME . \
#    --resource-group $ResourceGroup \
#    --image smilr/gotimeapi
