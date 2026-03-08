# my-website
Want to know more about me? This project shows a glimpse of who Tunde Abdulhamid Sanusi (Tuham) is, and what he does.

## Updated Information

This static site was initially built in 2023 and has been enhanced with automated CI/CD deployment using GitHub Actions and Azure Storage.

## Deployment Architecture

### GitHub Actions Workflow
- **File**: `.github/workflows/deploy.yml`
- **Trigger**: Automatically deploys when changes are pushed to the `main` branch (specifically when files in `website/` directory or the workflow itself are modified)
- **Authentication**: Uses Azure CLI with service principal credentials stored securely in GitHub repository secrets (`AZURE_CREDENTIALS`)

### Azure Deployment
- **File**: `scripts/deploy.sh`
- **Components**:
  - **Resource Group**: `tuhamstatic-site-rg` - Logical container for Azure resources
  - **Storage Account**: `mystaticstorage` - Hosts the static website
  - **Region**: `westus` - Azure region for resource deployment
  - **Static Website Hosting**: Enabled with `index.html` as the index document

### Deployment Flow
1. Changes pushed to `main` branch trigger the GitHub Actions workflow
2. Workflow checks out the repository code
3. Authenticates with Azure using stored service principal credentials
4. Executes `scripts/deploy.sh` which:
   - Creates the resource group and storage account (if they don't exist)
   - Enables static website hosting on the storage account
   - Uploads all website files from the `website/` directory to Azure Storage

## Setup Requirements
- Azure CLI installed and authenticated
- Azure subscription with appropriate permissions
- GitHub repository secrets configured with `AZURE_CREDENTIALS` (Azure service principal JSON)

## Screenshots
View screenshots of the website and deployment process in the [screenshots/](screenshots/) folder. 
