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

