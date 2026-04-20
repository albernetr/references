#!/usr/bin/env bash
set -euo pipefail

API_KEY="${1:-${OPENROUTER_API_KEY:-}}"
if [ -z "$API_KEY" ]; then
  echo "Error: provide API key as first argument or OPENROUTER_API_KEY env var"
  exit 1
fi

CLAUDE_BASE_URL="https://openrouter.ai/api"
CODEX_BASE_URL="https://openrouter.ai/api/v1"

# Detect shell profile
if [ -n "${ZSH_VERSION:-}" ] || [[ "${SHELL:-}" == *"zsh" ]]; then
  RC_FILE="$HOME/.zshrc"
else
  RC_FILE="$HOME/.bashrc"
fi

touch "$RC_FILE"

upsert_export() {
  local key="$1"
  local value="$2"
  if grep -qE "^export ${key}=" "$RC_FILE"; then
    sed -i.bak "s|^export ${key}=.*|export ${key}=\"${value}\"|" "$RC_FILE"
  else
    echo "export ${key}=\"${value}\"" >> "$RC_FILE"
  fi
}

# Persist vars for Claude + OpenRouter
upsert_export "OPENROUTER_API_KEY" "$API_KEY"
upsert_export "ANTHROPIC_BASE_URL" "$CLAUDE_BASE_URL"
upsert_export "ANTHROPIC_AUTH_TOKEN" "$API_KEY"
upsert_export "ANTHROPIC_API_KEY" ""
upsert_export "CLAUDE_CODE_SKIP_FAST_MODE_ORG_CHECK" "1"

if ! grep -q "OPENROUTER_OPENCODE_SHORTCUTS_START" "$RC_FILE"; then
  cat >> "$RC_FILE" <<'EOF'

# OPENROUTER_OPENCODE_SHORTCUTS_START
opfree() {
  opencode -m "openrouter/openrouter/free" "$@"
}

opfree_run() {
  opencode run -m "openrouter/openrouter/free" "$@"
}
# OPENROUTER_OPENCODE_SHORTCUTS_END
EOF
fi

# Current session
export OPENROUTER_API_KEY="$API_KEY"
export ANTHROPIC_BASE_URL="$CLAUDE_BASE_URL"
export ANTHROPIC_AUTH_TOKEN="$API_KEY"
export ANTHROPIC_API_KEY=""
export CLAUDE_CODE_SKIP_FAST_MODE_ORG_CHECK=1

# Codex config
mkdir -p "$HOME/.codex"
cat > "$HOME/.codex/config.toml" <<EOF
model_provider = "openrouter"
model_reasoning_effort = "high"
model = "openai/gpt-5.3-codex"

[model_providers.openrouter]
name = "openrouter"
base_url = "${CODEX_BASE_URL}"
env_key = "OPENROUTER_API_KEY"
EOF

echo "[OK] Claude Code configured for OpenRouter."
echo "[OK] Codex configured at $HOME/.codex/config.toml"
echo "[OK] OpenCode will use OpenRouter via OPENROUTER_API_KEY"

echo ""
echo "If Claude was previously logged in with Anthropic, run '/logout' inside Claude Code."
echo "Then run: source $RC_FILE"
echo "And start: claude, codex or opencode"
echo ""
echo "OpenCode examples:"
echo "  opencode -m \"openrouter/openrouter/free\""
echo "  opencode run -m \"openrouter/openrouter/free\" \"Hola\""
echo "Shortcuts available: opfree, opfree_run"
