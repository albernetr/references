# Ejercicios y Espacios Aislados MS Azure


## Configuracion de ambiente y seleccion de suscripciones

### Login
az login

### Busqueda suscripcion de trabajo
Obtenga los identificadores de la Suscripción de Concierge.

az account list --refresh --query "[?contains(name, 'Concierge Subscription')].id" --output table

### Establezca la suscripción predeterminada con el identificador de la suscripción. 

Reemplace {identificador de su suscripción} por el identificador más reciente de la Suscripción de Concierge.

az account set --subscription {your subscription ID}

### Establecer Grupo de Recursos

az configure --defaults group="learn-3b7e7e75-4a87-4753-bd7a-c6020cd11a73"

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
$env:Path += ";$($env:LOCALAPPDATA)\Programs\Bicep CLI"

### Implementación de la plantilla en Azure
az deployment group create --name main --template-file {nombre del archivo bicep}

#### Ejemplo
az deployment group create --name main --template-file main.bicep

