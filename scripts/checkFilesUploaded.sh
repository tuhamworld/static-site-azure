#!/bin/bash

# Configuration
RESOURCE_GROUP="tuhamstatic-site-rg"
STORAGE_ACCOUNT="tuhamstaticstorage"
LOCATION="westus"
WEBSITE_PATH="../website"


az storage blob list \
    --account-name $STORAGE_ACCOUNT \
    --container-name '$web' \
    --output table