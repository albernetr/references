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

# 📘 Grupos principales de Azure CLI (`az`) (parte 2)

| #  | Grupo         | Descripción                                             | Justificación de Importancia                          | Acciones comunes                                      | Nombre en el Portal                          |
|----|---------------|---------------------------------------------------------|--------------------------------------------------------|--------------------------------------------------------|-----------------------------------------------|
| 16 | sql           | Bases de datos SQL en la nube (Azure SQL)              | Opción de base de datos relacional administrada        | `server create`, `db create`, `list`                  | SQL databases                                 |
| 17 | postgres      | PostgreSQL flexible server                              | Base de datos relacional open-source                   | `server create`, `db create`, `firewall-rule create`  | Azure Database for PostgreSQL                 |
| 18 | mysql         | MySQL flexible server                                   | Otra opción popular de base de datos                   | `server create`, `db create`, `list`                  | Azure Database for MySQL                      |
| 19 | cosmosdb      | Base de datos NoSQL distribuida                         | Alta escalabilidad global, baja latencia               | `create`, `keys list`, `sql database create`          | Azure Cosmos DB                               |
| 20 | keyvault      | Maneja secretos, claves y certificados                  | Seguridad crítica para apps                            | `create`, `secret set`, `secret show`                 | Azure Key Vault                               |
| 21 | appconfig     | Configuración centralizada para apps                    | Gestión de variables de configuración                  | `create`, `kv set`, `list`                            | Azure App Configuration                       |
| 22 | network       | Redes virtuales, IPs, NSGs, firewalls                   | Arquitectura de red segura y aislada                   | `vnet create`, `nsg create`, `public-ip create`       | Redes virtuales                               |
| 23 | identity      | Identidades administradas para recursos                 | Acceso seguro entre servicios                          | `create`, `list`, `show`                              | Identidad administrada (Managed identity)     |
| 24 | policy        | Reglas y políticas de cumplimiento                      | Seguridad y gobernanza a gran escala                   | `definition list`, `assignment create`                | Políticas                                     |
| 25 | log-analytics | Espacios de trabajo para logs y queries                 | Monitoreo centralizado con Kusto Query Language (KQL)  | `workspace create`, `query`                           | Log Analytics workspaces                      |
| 26 | automation    | Automatización de tareas (runbooks)                    | Ejecuta tareas programadas o reactivas                 | `account create`, `runbook create`, `job start`       | Cuentas de automatización                     |
| 27 | billing       | Información de facturación y uso                        | Control y optimización de costos                       | `invoice list`, `usage list`, `budgets create`        | Cost Management + Billing                     |
| 28 | devops        | Integración con Azure DevOps (extensión)                | CI/CD, repositorios, artefactos                        | `pipeline run`, `repo list`, `project list`           | Azure DevOps (requiere activar organización)  |
| 29 | backup        | Protección de datos y respaldos                         | Alta disponibilidad y recuperación ante desastres      | `vault create`, `policy list`, `item list`            | Recovery Services vaults                      |
| 30 | managedapp    | Plantillas de apps administradas                        | Gestión avanzada de soluciones preempaquetadas         | `definition create`, `create`, `list`                 | Aplicaciones administradas                    |

# 📘 Grupos adicionales de Azure CLI (`az`) (del 31 al 50)

| #  | Grupo            | Descripción                                                  | Justificación de Importancia                        | Acciones comunes                                        | Nombre en el Portal                           |
|----|------------------|--------------------------------------------------------------|------------------------------------------------------|----------------------------------------------------------|------------------------------------------------|
| 31 | dns              | Manejo de zonas y registros DNS                              | Necesario para configurar nombres personalizados     | `zone create`, `record-set a add-record`                | DNS                                           |
| 32 | redis            | Cache distribuido en memoria                                 | Mejora de rendimiento para apps                      | `create`, `list`, `update`                              | Azure Cache for Redis                         |
| 33 | cdn              | Red de distribución de contenido                             | Mejora velocidad de carga global                     | `endpoint create`, `profile create`                     | CDN                                           |
| 34 | cognitive        | Servicios cognitivos de IA                                   | Reconocimiento facial, voz, texto, etc.              | `account create`, `list`, `keys list`                   | Cognitive Services                            |
| 35 | bot              | Servicios de bots inteligentes                               | Integración con canales como Teams, WebChat, etc.    | `create`, `show`, `publish`                             | Azure Bot Services                            |
| 36 | signalr          | Comunicación en tiempo real                                  | Útil para chats, notificaciones en apps              | `create`, `list`, `key list`                            | Azure SignalR Service                         |
| 37 | iot              | Dispositivos y hubs IoT                                      | Para soluciones de IoT a gran escala                 | `hub create`, `device create`                           | IoT Hub                                       |
| 38 | eventgrid        | Eventos de publicación/suscripción                           | Comunicación entre servicios basada en eventos       | `topic create`, `event-subscription create`             | Event Grid                                    |
| 39 | eventhubs        | Ingesta masiva de datos de eventos                           | Stream de eventos IoT, logs, apps                    | `namespace create`, `eventhub create`                   | Event Hubs                                    |
| 40 | servicebus       | Comunicación entre servicios con colas y temas               | Arquitectura distribuida robusta                     | `namespace create`, `queue create`, `topic create`      | Service Bus                                   |
| 41 | maps             | Servicios de mapas, geolocalización, rutas                   | Apps móviles, logística, seguimiento                  | `account create`, `list`, `keys list`                   | Azure Maps                                    |
| 42 | support          | Soporte técnico (crear solicitudes)                          | Administración empresarial y soporte técnico         | `ticket create`, `ticket list`                          | Centro de soporte                             |
| 43 | security         | Centro de seguridad de Azure                                 | Gestión de alertas y recomendaciones de seguridad    | `assessment list`, `secure-score list`                  | Microsoft Defender para la nube               |
| 44 | billing-benefits | Gestión de beneficios de facturación                         | Uso de reservas, ahorros                             | `savings-plan list`, `reservation-order list`           | Azure Reservations                            |
| 45 | datashare        | Compartir datos entre suscripciones o clientes               | Colaboración de datos simplificada                   | `account create`, `dataset create`, `share create`      | Azure Data Share                              |
| 46 | bicep            | Compilador para IaC (infraestructura como código)            | Nueva alternativa declarativa a ARM templates        | `build`, `decompile`, `publish`                         | No visible como recurso (CLI y VSCode)        |
| 47 | ml               | Azure Machine Learning                                       | Entrenamiento y despliegue de modelos de ML          | `workspace create`, `compute create`, `model list`      | Azure Machine Learning                        |
| 48 | kusto            | Consulta de datos con KQL (Kusto Query Language)             | Monitor, Log Analytics, App Insights                 | `cluster create`, `database create`                     | Azure Data Explorer                           |
| 49 | synapse          | Integración de big data, DWH y Spark                         | Arquitectura moderna de análisis de datos            | `workspace create`, `spark pool list`                   | Azure Synapse Analytics                       |
| 50 | purview          | Gobierno y catálogo de datos empresariales                   | Cumplimiento, linaje de datos                        | `account create`, `scan create`, `classification list`  | Microsoft Purview                             |

# 📘 Grupos adicionales relevantes en Azure CLI (51+)

| #  | Grupo           | Descripción                                                  | Justificación / Cuándo usarlo                        | Nombre en el Portal                      |
|----|------------------|--------------------------------------------------------------|------------------------------------------------------|-------------------------------------------|
| 51 | batch            | Procesamiento batch a gran escala                            | Tareas paralelas masivas (render, ciencia, etc.)     | Azure Batch                               |
| 52 | sentinel         | SIEM y análisis de seguridad                                 | Detección de amenazas centralizada                   | Microsoft Sentinel                        |
| 53 | quantum          | Recursos de computación cuántica                             | Investigación y simulación                           | Azure Quantum                             |
| 54 | vmss             | Conjuntos de escalado automático de VMs                      | Escalado horizontal automatizado                     | Conjuntos de escalado de máquinas virtuales |
| 55 | netappfiles      | Almacenamiento empresarial de alto rendimiento               | Migraciones de SAP, Oracle, etc.                     | Azure NetApp Files                        |
| 56 | sap              | SAP en Azure                                                 | Despliegues certificados para entornos SAP HANA      | SAP en Azure                              |
| 57 | disk             | Discos gestionados (separados de VMs)                        | Alta disponibilidad, snapshots, performance tuning   | Discos administrados                      |
| 58 | managed-cassandra| Cassandra gestionado                                         | NoSQL compatible con Cassandra                       | Azure Managed Instance for Apache Cassandra |
| 59 | maps-gen2        | API avanzada para mapas                                      | Versión más reciente de Azure Maps                   | Azure Maps (Gen2)                         |
| 60 | communication    | Servicios de comunicación (SMS, chat, voz)                   | Azure Communication Services                         | Azure Communication Services              |
| 61 | mobile-network   | Redes móviles privadas (5G)                                  | Edge computing y soluciones IoT industriales         | Mobile Network                             |
| 62 | peering          | Conexión privada entre redes (ISP, Azure)                    | Baja latencia entre Azure y tus sistemas físicos     | Azure Peering                             |
| 63 | express-route    | Conexión privada física a Azure                              | Alta seguridad, compliance                           | Azure ExpressRoute                        |
| 64 | relay            | Comunicación punto-a-punto segura                            | Sustituye a VPN ligera entre apps remotas            | Azure Relay                               |
| 65 | databricks       | Plataforma de ciencia de datos y ML colaborativa             | Procesamiento Spark, notebooks, pipelines de datos   | Azure Databricks                          |
| 66 | dms              | Servicio de migración de bases de datos                      | Migrar SQL Server, Oracle, PostgreSQL, etc.          | Database Migration Service                |
| 67 | recoveryservices | Almacén para backups y recuperación ante desastres           | Respaldos automáticos, restauraciones rápidas        | Recovery Services vaults                  |
| 68 | webpubsub        | Publicación y suscripción en tiempo real para websockets     | Comunicación WebSocket bidireccional                 | Web PubSub                                |
| 69 | datafactory      | ETL/ELT: integración y movimiento de datos                   | Pipelines de ingestión de datos                      | Azure Data Factory                        |
| 70 | support-mgmt     | Gestión avanzada de soporte empresarial                      | Acceso a contratos y solicitudes                     | Soporte técnico empresarial               |
