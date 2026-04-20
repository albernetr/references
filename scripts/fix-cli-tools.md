# Fix CLI Tools: opencode, codex & claude code

## Problema
Los CLIs instalados globalmente con `npm install -g` no son reconocidos en la terminal
porque `C:\Users\<usuario>\AppData\Roaming\npm` no está en el `PATH` del sistema.

---

## Solución rápida

### Windows (PowerShell)
```powershell
.\fix-cli-tools.ps1
```

### macOS / Linux (Bash)
```bash
chmod +x fix-cli-tools.sh
./fix-cli-tools.sh
```

---

## Herramientas instaladas

| Herramienta   | Paquete npm              | Comando   |
|---------------|--------------------------|-----------|
| OpenCode      | `opencode-ai`            | `opencode`|
| Codex         | `@openai/codex`          | `codex`   |
| Claude Code   | `@anthropic-ai/claude-code` | `claude` |

---

## Verificación manual

Después de ejecutar el script, abre una **nueva terminal** y ejecuta:

```bash
opencode --version
codex --version
claude --version
```

---

## Notas
- En Windows, el cambio de PATH es **permanente** para el usuario actual.
- En macOS/Linux, el script agrega la línea al archivo `~/.zshrc` o `~/.bashrc`.
- Si usas `nvm`, asegúrate de que el directorio de npm global esté actualizado al cambiar de versión de Node.
