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


# Definición de los recursos con Bicep, las plantillas de ARM y el proveedor de AzAPI de Terraform
https://learn.microsoft.com/es-es/azure/templates/

# Documentación de la Plantilla Bicep

Esta plantilla Bicep despliega un plan de App Service y una aplicación de App Service en Azure. A continuación, se detallan los parámetros, variables y recursos utilizados en la plantilla.

## Parámetros

- **environmentName**: El nombre del entorno. Debe ser uno de los siguientes valores: `dev`, `test` o `prod`. Valor por defecto: `dev`.
    ```bicep
    @description('El nombre del entorno. Debe ser dev, test o prod.')
    @allowed(['dev', 'test', 'prod'])
    param environmentName string = 'dev'
    ```

- **solutionName**: El nombre único de la solución. Se utiliza para garantizar que los nombres de los recursos sean únicos. Debe tener una longitud mínima de 5 caracteres y máxima de 30 caracteres. Valor por defecto: `toyhr${uniqueString(resourceGroup().id)}`.
    ```bicep
    @description('El nombre único de la solución. Se utiliza para garantizar que los nombres de los recursos sean únicos.')
    @minLength(5)
    @maxLength(30)
    param solutionName string = 'toyhr${uniqueString(resourceGroup().id)}'
    ```

- **appServicePlanInstanceCount**: El número de instancias del plan de App Service. Debe ser un valor entre 1 y 10. Valor por defecto: `1`.
    ```bicep
    @description('El número de instancias del plan de App Service.')
    @minValue(1)
    @maxValue(10)
    param appServicePlanInstanceCount int = 1
    ```

- **appServicePlanSku**: El nombre y nivel del SKU del plan de App Service. Valor por defecto: `{ name: 'F1', tier: 'Free' }`.
    ```bicep
    @description('El nombre y nivel del SKU del plan de App Service.')
    param appServicePlanSku object = {
        name: 'F1'
        tier: 'Free'
    }
    ```

- **location**: La región de Azure en la que se deben implementar los recursos. Valor por defecto: `eastus`.
    ```bicep
    @description('La región de Azure en la que se deben implementar los recursos.')
    param location string = 'eastus'
    ```

## Variables

- **appServicePlanName**: Nombre del plan de App Service, compuesto por el nombre del entorno y el nombre de la solución.
    ```bicep
    var appServicePlanName = '${environmentName}-${solutionName}-plan'
    ```

- **appServiceAppName**: Nombre de la aplicación de App Service, compuesto por el nombre del entorno y el nombre de la solución.
    ```bicep
    var appServiceAppName = '${environmentName}-${solutionName}-app'
    ```

## Recursos

- **appServicePlan**: Recurso del plan de App Service.
    ```bicep
    resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
        name: appServicePlanName
        location: location
        sku: {
            name: appServicePlanSku.name
            tier: appServicePlanSku.tier
            capacity: appServicePlanInstanceCount
        }
    }
    ```

- **appServiceApp**: Recurso de la aplicación de App Service.
    ```bicep
    resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
        name: appServiceAppName
        location: location
        properties: {
            serverFarmId: appServicePlan.id
            httpsOnly: true
        }
    }
    ```

Esta plantilla Bicep permite desplegar un plan de App Service y una aplicación de App Service en la región especificada, con las configuraciones de SKU y número de instancias definidas por los parámetros. Los nombres de los recursos se generan de manera única utilizando el nombre del entorno y el nombre de la solución.

