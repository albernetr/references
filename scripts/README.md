# Scripts de configuración OpenRouter

Esta carpeta contiene scripts para configurar **Claude Code**, **Codex CLI** y **OpenCode** con OpenRouter.

## Archivos

- `setup-openrouter.ps1` (Windows/PowerShell)
- `setup-openrouter.sh` (Linux/macOS Bash/Zsh)

## Qué configuran

### Claude Code
- `OPENROUTER_API_KEY`
- `ANTHROPIC_BASE_URL=https://openrouter.ai/api`
- `ANTHROPIC_AUTH_TOKEN=$OPENROUTER_API_KEY`
- `ANTHROPIC_API_KEY=""` (vacío, requerido para evitar conflicto)
- `CLAUDE_CODE_SKIP_FAST_MODE_ORG_CHECK=1`

### Codex CLI
Crea `~/.codex/config.toml` con:
- `model_provider = "openrouter"`
- `model = "openai/gpt-5.3-codex"`
- `base_url = "https://openrouter.ai/api/v1"`
- `env_key = "OPENROUTER_API_KEY"`

### OpenCode
- Usa `OPENROUTER_API_KEY` desde entorno (ya configurada por los scripts).
- No requiere archivo extra para empezar si invocas el modelo explícitamente con `-m`.

## Uso

### Windows
```powershell
.\scripts\setup-openrouter.ps1 -OpenRouterApiKey "TU_API_KEY"
```

### Linux/macOS
```bash
chmod +x ./scripts/setup-openrouter.sh
./scripts/setup-openrouter.sh "TU_API_KEY"
```

## Verificación

- Inicia nueva terminal
- `claude`
- En Claude ejecuta `/status` y valida:
  - Auth token: `ANTHROPIC_AUTH_TOKEN`
  - Anthropic base URL: `https://openrouter.ai/api`
- `codex`
- `opencode providers list` (debe mostrar OpenRouter en Environment)

## Conexión directa (ejemplos)

### Claude
```bash
claude --model openrouter/free
```

### Codex
```bash
codex -c model="openrouter/free"
codex exec --skip-git-repo-check -c model="openrouter/free" "Hola"
```

### OpenCode
```bash
opencode -m "openrouter/openrouter/free"
opencode run -m "openrouter/openrouter/free" "Hola"
```

### Atajos recomendados

Después de correr los scripts tendrás:

```bash
opfree
opfree_run "Hola"
```

- `opfree`: abre OpenCode directamente con `openrouter/openrouter/free`
- `opfree_run`: ejecución no interactiva con el mismo modelo

## Nota
Si Claude estaba logueado antes con Anthropic, ejecuta `/logout` dentro de Claude y vuelve a abrir sesión.
