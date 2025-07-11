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

