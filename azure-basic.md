# 🌐 Introducción a Azure y sus herramientas CLI

## ¿Qué es Microsoft Azure?

**Azure** es la plataforma de computación en la nube de Microsoft. Ofrece servicios de infraestructura (IaaS), plataforma (PaaS) y software (SaaS) para desarrollar, desplegar y administrar aplicaciones en una red global de centros de datos.

Es ideal para:
- Hospedar aplicaciones web
- Gestionar bases de datos
- Desplegar contenedores
- Automatizar flujos DevOps
- Implementar inteligencia artificial y más

---

## 🏗️ Estructura jerárquica de Azure

Azure organiza todos sus servicios bajo una estructura lógica, desde la organización global hasta los recursos individuales.

Tenant (Azure Active Directory / Entra ID)
├── Subscription (Suscripción)
│ ├── Resource Group (Grupo de recursos)
│ │ ├── Resources (Máquinas, Apps, Bases de datos, etc.)
│ │ └── Ubicación/Región (ej. eastus, brazilsouth)

### Elementos clave:

- **Tenant**: Contenedor de identidades y políticas (usuarios, grupos, roles). Equivale a la organización.
- **Subscription**: Unidad de facturación. Todo consumo se carga aquí.
- **Resource Group**: Agrupación lógica de recursos relacionados.
- **Region**: Ubicación física del centro de datos donde vive el recurso.
- **Resources**: Elementos específicos como VMs, App Services, bases de datos, etc.

---

## 🔧 Azure CLI (`az`)

La **Azure CLI** es una herramienta de línea de comandos multiplataforma para interactuar con los servicios de Azure.

### 📦 Estructura base de comandos:

```bash
az <grupo> <subcomando> --argumentos
az login                                 # Iniciar sesión
az group create --name rg1 --location eastus
az webapp up --name miapp --resource-group rg1 --runtime "PYTHON:3.11"

## 🔧 🚀 Azure Developer CLI (azd)
La Azure Developer CLI (azd) es una herramienta más orientada a desarrolladores. Facilita el desarrollo y despliegue de aplicaciones completas en Azure.

Se integra con:

Infraestructura como código (Bicep/Terraform)

App Services, bases de datos, contenedores

Proyectos en Python, Node.js, .NET, etc.

### 📦 Comandos básicos:

azd init       # Inicializa el proyecto Azure
azd up         # Despliega toda la solución
azd down       # Elimina lo desplegado

# 📘 Grupos principales de Azure CLI (`az`) con nombres del portal

| #  | Grupo         | Descripción                                             | Justificación de Importancia                          | Acciones comunes                                      | Nombre en el Portal                          |
|----|---------------|---------------------------------------------------------|--------------------------------------------------------|--------------------------------------------------------|-----------------------------------------------|
| 1  | account       | Gestiona cuentas, suscripciones y tenant                | Base para autenticarse y trabajar en Azure             | `login`, `show`, `list`, `set`                        | Suscripciones                                 |
| 2  | group         | Maneja grupos de recursos (resource groups)             | Agrupador lógico de recursos                           | `create`, `list`, `delete`, `show`                    | Grupos de recursos                            |
| 3  | resource      | Consulta o administra cualquier recurso                 | Interacción genérica con recursos                      | `list`, `show`, `delete`, `tag`                       | Todos los recursos                            |
| 4  | webapp        | Gestiona App Services (apps web)                        | Despliegue de apps Python, Node, .NET                  | `up`, `create`, `browse`, `config`                    | Aplicaciones web (App Services)              |
| 5  | ad            | Azure Active Directory / Entra ID                      | Identidad y control de acceso                          | `user list`, `signed-in-user show`                   | Microsoft Entra ID                            |
| 6  | role          | Gestión de permisos y roles (RBAC)                      | Controla acceso granular                               | `assignment list`, `definition list`, `create`        | Control de acceso (IAM)                       |
| 7  | login         | Autenticación (alias de `az account login`)             | Necesario para todo                                    | `az login`                                           | Inicio de sesión                              |
| 8  | deployment    | Despliegues ARM o Bicep (IaC)                           | Infraestructura como código                            | `group create`, `validate`                           | Implementaciones                              |
| 9  | storage       | Almacenamiento de blobs, archivos, colas                | Clave en backend, backups y más                        | `account create`, `blob upload`, `container list`     | Cuentas de almacenamiento                     |
| 10 | vm            | Máquinas virtuales                                      | Infraestructura clásica                                | `create`, `start`, `stop`, `delete`, `list`           | Máquinas virtuales                            |
| 11 | container     | Instancias de contenedores (ACI)                        | Ejecutar contenedores rápidamente                      | `create`, `logs`, `exec`, `list`                      | Instancias de contenedor                      |
| 12 | acr           | Registro privado de imágenes Docker                     | Para CI/CD y despliegues con contenedores              | `login`, `repository list`                           | Registro de contenedor (ACR)                  |
| 13 | aks           | Azure Kubernetes Service                                | Orquestación de contenedores (K8s)                     | `create`, `get-credentials`, `list`                   | Clústeres de Kubernetes (AKS)                 |
| 14 | functionapp   | Azure Functions                                         | Arquitectura serverless                                | `create`, `list`, `show`, `config`                    | Aplicaciones de funciones                     |
| 15 | monitor       | Monitoreo y alertas                                     | Observabilidad en producción                           | `metrics list`, `activity-log`, `diagnostic-settings` | Monitor                                        |

