# Creacion y ejecucion de imagen en ACR

az group create --location eastus --name myResourceGroup
az acr create --resource-group myResourceGroup --name acrtestleon --sku Basic
echo FROM mcr.microsoft.com/hello-world > Dockerfile
az acr build --image sample/hello-world:v1 --registry acrtestleon --file Dockerfile .
az acr repository list --name acrtestleon --output table
az acr repository show-tags --name acrtestleon  --repository sample/hello-world --output table
az acr run --registry acrtestleon --cmd '$Registry/sample/hello-world:v1' /dev/null

# Despliegue de una instancia de ACR

## Paso 1 -  Crear el grupo de recursos
az group create --location eastus --name myResourceGroupLT

## Paso 2 - Crear y desplegar el contenedor

a- Definir el nombre del DNS
DNS_NAME_LABEL=aci-example-$RANDOM

b- creacion de la instancia del contenedor

az container create --resource-group myResourceGroupLT \
    --name mycontainer-lt \
    --image mcr.microsoft.com/azuredocs/aci-helloworld \
    --ports 80 \
    --dns-name-label $DNS_NAME_LABEL --location eastus \
    --os-type Linux \
    --cpu 1 \
    --memory 1.5 

## Paso 3 - Verificar que el contenedor esta corriendo

az container show --resource-group myResourceGroupLT \
    --name mycontainer-lt \
    --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
    --out table 
	
---------------------------------------------------------------------
# Despliegue de un contendor en Azure Container Apps con Azure CLI
---------------------------------------------------------------------

az group create --location eastus --name myResourceGroupLT

## obtener la ultima version de containers apps
az extension add --name containerapp --upgrade

## Registrar los nombres de espacios
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

## Creación del environment para ACR
az containerapp env create \
    --name my-container-env-lt \
    --resource-group myResourceGroupLT \
    --location eastus

## Desplegar el contendor dentro del environment

az containerapp create \
    --name my-container-app-lt \
    --resource-group myResourceGroupLT \
    --environment my-container-env-lt \
    --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest \
    --target-port 80 \
    --ingress 'external' \
    --query properties.configuration.ingress.fqdn
