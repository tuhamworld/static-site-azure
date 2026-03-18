#!/bin/bash

# Configuration
RESOURCE_GROUP="tuhamstatic-site-rg"
STORAGE_ACCOUNT="tuhamstaticstorage"
LOCATION="westus"
WEBSITE_PATH="website"

# Check if resource group exists
if ! az group exists --name $RESOURCE_GROUP | grep -q true; then
    echo "Creating resource group..."
    az group create --name $RESOURCE_GROUP --location $LOCATION
fi

# Check if storage account exists
if ! az storage account show --name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP 2>/dev/null; then
    echo "Creating storage account..."
    az storage account create \
        --name $STORAGE_ACCOUNT \
        --resource-group $RESOURCE_GROUP \
        --location $LOCATION
    
    # Enable static website hosting
    az storage blob service-properties update \
        --account-name $STORAGE_ACCOUNT \
        --static-website \
        --index-document index.html
fi

# Upload website files
echo "Uploading website files..."
az storage blob upload-batch \
    --account-name $STORAGE_ACCOUNT \
    -d '$web' \
    -s $WEBSITE_PATH

echo "Website deployed!"