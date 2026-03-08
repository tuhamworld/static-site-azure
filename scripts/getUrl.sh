#!/bin/bash

# Configuration
RESOURCE_GROUP="tuhamstatic-site-rg"
STORAGE_ACCOUNT="tuhamstaticstorage"
LOCATION="westus"
WEBSITE_PATH="../website"


az storage account show \
    --name $STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP \
    --query 'primaryEndpoints.web' \
    --output tsv