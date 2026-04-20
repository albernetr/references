#!/usr/bin/env bash
# fix-cli-tools.sh
# Instala y configura opencode, codex y claude code en macOS/Linux
# Uso: chmod +x fix-cli-tools.sh && ./fix-cli-tools.sh

set -e

# ─────────────────────────────────────────────
# 1. Detectar shell y archivo de configuracion
# ─────────────────────────────────────────────
if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "$(which zsh)" ]; then
    SHELL_RC="$HOME/.zshrc"
else
    SHELL_RC="$HOME/.bashrc"
fi

# ─────────────────────────────────────────────
# 2. Agregar npm global bin al PATH si no existe
# ─────────────────────────────────────────────
NPM_GLOBAL_BIN="$(npm config get prefix)/bin"

if ! echo "$PATH" | grep -q "$NPM_GLOBAL_BIN"; then
    echo "" >> "$SHELL_RC"
    echo "# npm global bin (agregado por fix-cli-tools.sh)" >> "$SHELL_RC"
    echo "export PATH=\"\$PATH:$NPM_GLOBAL_BIN\"" >> "$SHELL_RC"
    export PATH="$PATH:$NPM_GLOBAL_BIN"
    echo "[OK] PATH actualizado con: $NPM_GLOBAL_BIN en $SHELL_RC"
else
    echo "[INFO] $NPM_GLOBAL_BIN ya estaba en PATH."
fi

# ─────────────────────────────────────────────
# 3. Instalar paquetes globales
# ─────────────────────────────────────────────
PACKAGES=(
    "opencode-ai:opencode"
    "@openai/codex:codex"
    "@anthropic-ai/claude-code:claude"
)

for entry in "${PACKAGES[@]}"; do
    pkg="${entry%%:*}"
    cmd="${entry##*:}"
    echo ""
    echo "[...] Instalando $pkg..."
    npm install -g "$pkg" && echo "[OK] $pkg instalado." || echo "[ERROR] Fallo al instalar $pkg."
done

# ─────────────────────────────────────────────
# 4. Verificar versiones
# ─────────────────────────────────────────────
echo ""
echo "============ Verificacion ============"
for entry in "${PACKAGES[@]}"; do
    cmd="${entry##*:}"
    if version=$("$cmd" --version 2>&1); then
        echo "[OK] $cmd: $version"
    else
        echo "[WARN] $cmd no responde. Ejecuta: source $SHELL_RC"
    fi
done

echo ""
echo "[LISTO] Ejecuta 'source $SHELL_RC' o abre una nueva terminal para aplicar los cambios."
