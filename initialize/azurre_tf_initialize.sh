### thhis is sh file, but do not run in as a whole run it one line at a time
### so that you understand what is going on wnd what information need in each steps

# Change these variables according to your needs
ARM_SUBSCRIPTION_ID=<>
ARM_TENANT_ID=<>
RESOURCE_GROUP_NAME=terraformstate
STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=tfstate
VAULT_NAME=myKeyVault$RANDOM
STORAGE_ACCOUNT_KEY=storageaccountkey
SP_NAME=sp-ops-terraform
SP_SCOPE=/subscriptions/$ARM_SUBSCRIPTION_ID

az login --use-device-code
# Create Resource Group, Storage Account and Container for Terraform backend (securely storing Terraform plan)

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus #eastus2, southcentralus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query "[0].value" -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"

# Create Azure KeyVault
az keyvault create -g $RESOURCE_GROUP_NAME --name $VAULT_NAME 

# Set Azure KeyVault Secret value to storage account key
az keyvault secret set --vault-name $VAULT_NAME --name $STORAGE_ACCOUNT_KEY --value $ACCOUNT_KEY



#### Following line get the app id, but, do run the az command stand alone to get a json output whhich will contain the the secret, 
#### ideally in an devop pipeline, one should get hold of that secret id and store in a vault and later get it during a build
#### APP_ID=$(az ad sp create-for-rbac --name $SP_NAME --role="Contributor" --scopes=$SP_SCOPE --query 'appId' -o tsv)

az ad sp create-for-rbac --name $SP_NAME --role="Contributor" --scopes=$SP_SCOPE
{
    "appId": "XXXXX",
    "displayName": "#####",
    "password": "######",
    "tenant": "#####"
}
## this command will assign the service prinicpal with the scope, 
## reduce the scope to a rs group if you are not creating anything at subscription level
az role assignment create --assignee $APP_ID --role "Contributor" --scope $SP_SCOPE

#az account show
#az account list --query "[].{name:name, subscriptionId:id}"
#az account set --subscription=$ARM_SUBSCRIPTION_ID