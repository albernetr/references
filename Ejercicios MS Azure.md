# Ejercicios y Espacios Aislados MS Azure


## Configuracion de ambiente y seleccion de suscripciones

### install the Azure CLI
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

### Instalazion AZD
Desde powershell ejecutar: 

```powershell
Invoke-WebRequest -Uri https://aka.ms/install-azd.ps1 -OutFile install-azd.ps1
.\install-azd.ps1
```

### Login
az login

### Busqueda suscripcion de trabajo
Obtenga los identificadores de la Suscripción de Concierge.

```powershell
az account list --refresh --query "[?contains(name, 'Concierge Subscription')].id" --output table 
```

### Establezca la suscripción predeterminada con el identificador de la suscripción. 

Reemplace {identificador de su suscripción} por el identificador más reciente de la Suscripción de Concierge.

az account set --subscription {your subscription ID}

### Ver suscripcion activa
``` powershell
az account show
```
### Ver Todas las Suscripciones disponibles

```powershell
az account list --output table
```

### Establecer Grupo de Recursos

az configure --defaults group="learn-22f3d21a-7013-4d18-be25-a32250167693"

## Rutas de apredizaje

### Implement knowledge mining with Azure AI Search
https://learn.microsoft.com/en-us/training/paths/implement-knowledge-mining-azure-cognitive-search/

### AZ-104: Implementación y administración de recursos de procesos de Azure
https://learn.microsoft.com/es-mx/training/paths/az-104-manage-compute-resources/

### Aspectos básicos de Bicep
https://learn.microsoft.com/es-mx/training/paths/fundamentals-bicep/

### Create agents in Microsoft Copilot Studio
https://learn.microsoft.com/en-us/training/paths/create-extend-custom-copilots-microsoft-copilot-studio/

### Create copilots with Microsoft Copilot Studio
https://learn.microsoft.com/en-us/training/paths/work-power-virtual-agents/



## Definición de recursos en una plantilla de Bicep

Duracion Espacio Aislado: 4 horas.

Descripcion: En este ejercicio, creará una cuenta de almacenamiento, un plan de Azure App Service y una aplicación.

Url: https://learn.microsoft.com/es-mx/training/modules/build-first-bicep-template/4-exercise-define-resources-bicep-template?pivots=powershell

### Instalación de herramientas de Bicep

https://learn.microsoft.com/es-es/azure/azure-resource-manager/bicep/install?tabs=azure-powershell#azure-powershell

### Agregar Bicep al paht de la terminal
```powershell
$env:Path += ";$($env:LOCALAPPDATA)\Programs\Bicep CLI"
```

### Implementación de la plantilla en Azure
az deployment group create --name main --template-file {nombre del archivo bicep}

#### Ejemplo
```powershell
az deployment group create --name main --template-file main.bicep
```
###  verificar la implementación desde la línea de comandos
```powershell
az deployment group list --output table
```
## Ejercicio: Adición de parámetros y variables a la plantilla de Bicep

Duracion Espacio Aislado: 4 horas.

Link: https://learn.microsoft.com/es-mx/training/modules/build-first-bicep-template/6-exercise-add-parameters-variables-bicep-template?pivots=cli

### Desplegar plantilla con parametros
```powershell
az deployment group create --name main --template-file main.bicep --parameters environmentType=nonprod
```
## Ejercicio: Adición de parámetros y decoradores

Duracion Espacio Aislado: 4 horas.

https://learn.microsoft.com/es-mx/training/modules/build-reusable-bicep-templates-parameters/3-exercise-add-parameters-with-decorators?pivots=cli

## Ejercicio: Adición de un archivo de parámetros y de parámetros seguros Key Vault
Duracion Espacio Aislado: 4 horas.
[Ejercicio: Adición de un archivo de parámetros y de parámetros seguros](https://learn.microsoft.com/es-mx/training/modules/build-reusable-bicep-templates-parameters/6-exercise-create-use-parameter-files?pivots=cli)

### Creacion de variables e ingreso de parametos para la creacion dinamica del key vault

Region disponible para SQL Server: westus3
Powershell
```powershell
$keyVaultName = 'YOUR-KEY-VAULT-NAME'
$login = Read-Host "Enter the login name" -AsSecureString
$password = Read-Host "Enter the password" -AsSecureString

New-AzKeyVault -VaultName $keyVaultName -Location eastus -EnabledForTemplateDeployment
Set-AzKeyVaultSecret -VaultName $keyVaultName -Name 'sqlServerAdministratorLogin' -SecretValue $login
Set-AzKeyVaultSecret -VaultName $keyVaultName -Name 'sqlServerAdministratorPassword' -SecretValue $password
```
Azure Cli

```powershell
keyVaultName='YOUR-KEY-VAULT-NAME'
read -s -p "Enter the login name: " login
read -s -p "Enter the password: " password

az keyvault create --name $keyVaultName --location eastus --enabled-for-template-deployment true
az keyvault secret set --vault-name $keyVaultName --name "sqlServerAdministratorLogin" --value $login --output none
az keyvault secret set --vault-name $keyVaultName --name "sqlServerAdministratorPassword" --value $password --output none
```
### Obtención del identificador de recurso del almacén de claves
Para usar los secretos del almacén de claves en la implementación, necesita el identificador de recurso del almacén. Ejecute el siguiente comando para recuperar el identificador de recurso del almacén de claves:

```powershell
az keyvault show --name $keyVaultName --query id --output tsv
```
## Ejercicio: Uso de bucles de variables y de salidas
Horas: 

link: https://learn.microsoft.com/es-mx/training/modules/build-flexible-bicep-templates-conditions-loops/8-exercise-loops-variables-outputs?pivots=cli
______________________________________________________________________________________________________________

## ejecucion de plantilla con archivo de parametros
```powershell
az deployment group create --template-file main.bicep --parameters main.parameters.json
```


# Definición de los recursos con Bicep, las plantillas de ARM y el proveedor de AzAPI de Terraform
https://learn.microsoft.com/es-es/azure/templates/

