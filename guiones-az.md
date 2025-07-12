# 🔐 Cerrar sesión y limpiar datos de Azure CLI

Este documento te muestra cómo **cerrar tu sesión actual en Azure CLI** y **borrar toda la configuración** para iniciar sesión con otra cuenta o usuario.

---

## 🧾 OPCIÓN 1: Usar línea de comandos paso a paso


# 1. Cerrar sesión actual y Borrar suscripción activa del contexto local
```bash
az logout
az account clear
```
# 2. Iniciar sesión listar y seleccionar suscripción
```bash
az login
az account list --output table
az account set --subscription "<NOMBRE_O_ID_DE_LA_SUSCRIPCIÓN>"
az account show --output table
```

# 3. Listar grupos de recursos, seleccionar uno y mostrar sus recursos

```bash
# Listar todos los grupos de recursos en formato tabla
az group list --output table

# (Opcional) Establecer una variable con el nombre del grupo seleccionado
RG="nombre-del-grupo"

# Mostrar los recursos del grupo seleccionado
az resource list --resource-group "$RG" --output table

```
# 4. Crear grupo de recursos y Azure Container Registry (ACR)

```bash
# Variables
RG="demo-fastapi-rg"
LOCATION="eastus"
ACR_NAME="acrfastapi$RANDOM"  # El nombre debe ser único a nivel global

# A. Crear grupo de recursos
az group create --name "$RG" --location "$LOCATION"

# B. Crear registro de contenedor (ACR)
az acr create \
  --resource-group "$RG" \
  --name "$ACR_NAME" \
  --sku Basic \
  --admin-enabled true

# C. Obtener el login server (URL del ACR)
az acr show --name "$ACR_NAME" --query "loginServer" --output tsv
```

# 5. Crear proyecto FastAPI personalizado con Alpine y Dockerfile

```bash
# A. Crear carpeta del proyecto
mkdir fastapi-alpine
cd fastapi-alpine

# B. Crear archivo principal de la app FastAPI
cat <<EOF > main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def hello():
    return {"message": "Hola mundo desde Alpine + FastAPI"}
EOF

# C. Crear archivo requirements.txt
echo "fastapi\nuvicorn" > requirements.txt

# D. Crear Dockerfile usando imagen base de Alpine
cat <<EOF > Dockerfile
FROM python:3.11-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema necesarias
RUN apk add --no-cache build-base

# Copiar archivos
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Ejecutar la app con Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
EOF

# 6. Construir imagen Docker, probarla localmente y subirla a ACR

```bash
# Variables (ajustar si lo hiciste antes en otro terminal)
ACR_NAME="acrfastapiXXXX"  # ← reemplaza con tu ACR real (puedes recuperar con az acr list)
ACR_NAME="acrfastapi14149"
IMAGE_NAME="fastapi-alpine"
TAG="v1"
FULL_IMAGE="$ACR_NAME.azurecr.io/$IMAGE_NAME:$TAG"

# 1. Construir imagen Docker local
docker build -t "$FULL_IMAGE" .

# 2. Probar localmente (opcional)
docker run -d -p 8000:80 "$FULL_IMAGE"
curl http://localhost:8000

# 3. Login en ACR desde Docker
az acr login --name "$ACR_NAME"

# 4. Subir imagen al ACR
docker push "$FULL_IMAGE"

# 7. Desplegar imagen desde ACR en Azure Container Instances (ACI)

```bash
# Variables (ajustar según lo usado antes)
RG="demo-fastapi-rg"
ACI_NAME="fastapi-app"
ACR_NAME="acrfastapiXXXX"  # reemplazar con tu nombre real
IMAGE_NAME="fastapi-alpine"
TAG="v1"
FULL_IMAGE="$ACR_NAME.azurecr.io/$IMAGE_NAME:$TAG"
LOCATION="eastus"

# 1. Obtener credenciales del ACR (usuario/contraseña)
az acr credential show --name "$ACR_NAME"

# Opcional: guardar en variables (más limpio si haces scripts)
ACR_USER=$(az acr credential show --name "$ACR_NAME" --query "username" -o tsv)
ACR_PASS=$(az acr credential show --name "$ACR_NAME" --query "passwords[0].value" -o tsv)

# 2. Crear instancia de contenedor (ACI)
az container create \
  --resource-group "$RG" \
  --name "$ACI_NAME" \
  --image "$FULL_IMAGE" \
  --registry-login-server "$ACR_NAME.azurecr.io" \
  --registry-username "$ACR_USER" \
  --registry-password "$ACR_PASS" \
  --dns-name-label "$ACI_NAME-$RANDOM" \
  --ports 80 \
  --location "$LOCATION"

# 3. Verificar el estado de despliegue
az container show --resource-group "$RG" --name "$ACI_NAME" --output table

