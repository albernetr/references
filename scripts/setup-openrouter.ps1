param(
    [string]$OpenRouterApiKey,
    [switch]$Persist = $true,
    [switch]$EnableFastMode = $true
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($OpenRouterApiKey)) {
    $OpenRouterApiKey = $env:OPENROUTER_API_KEY
}

if ([string]::IsNullOrWhiteSpace($OpenRouterApiKey)) {
    Write-Error "No API key provided. Use -OpenRouterApiKey or set OPENROUTER_API_KEY first."
    exit 1
}

$claudeBaseUrl = 'https://openrouter.ai/api'
$codexBaseUrl = 'https://openrouter.ai/api/v1'

# Session env
$env:OPENROUTER_API_KEY = $OpenRouterApiKey
$env:ANTHROPIC_BASE_URL = $claudeBaseUrl
$env:ANTHROPIC_AUTH_TOKEN = $OpenRouterApiKey
$env:ANTHROPIC_API_KEY = ''
if ($EnableFastMode) {
    $env:CLAUDE_CODE_SKIP_FAST_MODE_ORG_CHECK = '1'
}

if ($Persist) {
    [Environment]::SetEnvironmentVariable('OPENROUTER_API_KEY', $OpenRouterApiKey, 'User')
    [Environment]::SetEnvironmentVariable('ANTHROPIC_BASE_URL', $claudeBaseUrl, 'User')
    [Environment]::SetEnvironmentVariable('ANTHROPIC_AUTH_TOKEN', $OpenRouterApiKey, 'User')
    [Environment]::SetEnvironmentVariable('ANTHROPIC_API_KEY', '', 'User')
    if ($EnableFastMode) {
        [Environment]::SetEnvironmentVariable('CLAUDE_CODE_SKIP_FAST_MODE_ORG_CHECK', '1', 'User')
    }

    $profilePath = $PROFILE.CurrentUserAllHosts
    $profileDir = Split-Path -Parent $profilePath
    if (-not (Test-Path $profileDir)) {
        New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
    }
    if (-not (Test-Path $profilePath)) {
        New-Item -ItemType File -Path $profilePath -Force | Out-Null
    }

    $profileContent = Get-Content -Path $profilePath -Raw
    if ($profileContent -notmatch '# OPENROUTER_OPENCODE_SHORTCUTS_START') {
        Add-Content -Path $profilePath -Value @"

# OPENROUTER_OPENCODE_SHORTCUTS_START
function global:opfree {
    & opencode -m "openrouter/openrouter/free" @args
}

function global:opfree_run {
    param([Parameter(ValueFromRemainingArguments=`$true)][string[]]`$Prompt)
    & opencode run -m "openrouter/openrouter/free" @Prompt
}
# OPENROUTER_OPENCODE_SHORTCUTS_END
"@
    }
}

function global:opfree {
    & opencode -m "openrouter/openrouter/free" @args
}

function global:opfree_run {
    param([Parameter(ValueFromRemainingArguments=$true)][string[]]$Prompt)
    & opencode run -m "openrouter/openrouter/free" @Prompt
}

# Codex config
$codexDir = Join-Path $HOME '.codex'
$codexConfig = Join-Path $codexDir 'config.toml'
New-Item -ItemType Directory -Path $codexDir -Force | Out-Null

$codexToml = @"
model_provider = "openrouter"
model_reasoning_effort = "high"
model = "openai/gpt-5.3-codex"

[model_providers.openrouter]
name = "openrouter"
base_url = "$codexBaseUrl"
env_key = "OPENROUTER_API_KEY"
"@

Set-Content -Path $codexConfig -Value $codexToml -Encoding UTF8

Write-Host "[OK] Claude Code configured for OpenRouter." -ForegroundColor Green
Write-Host "[OK] Codex configured at $codexConfig." -ForegroundColor Green
Write-Host "[OK] OpenCode will use OpenRouter via OPENROUTER_API_KEY." -ForegroundColor Green

Write-Host "\nVerification:" -ForegroundColor Cyan
try { 
    $claudeV = (& claude --version 2>$null)
    if ($claudeV) { Write-Host "[OK] claude: $claudeV" -ForegroundColor Green }
} catch {}
try {
    $codexV = (& codex --version 2>$null)
    if ($codexV) { Write-Host "[OK] codex: $codexV" -ForegroundColor Green }
} catch {}
try {
    $opencodeV = (& opencode --version 2>$null)
    if ($opencodeV) { Write-Host "[OK] opencode: $opencodeV" -ForegroundColor Green }
} catch {}

Write-Host "\nImportant: If Claude was previously logged in directly with Anthropic, run '/logout' inside Claude Code." -ForegroundColor Yellow
Write-Host "Then open a NEW terminal and run: claude" -ForegroundColor Yellow
Write-Host "OpenCode examples:" -ForegroundColor Yellow
Write-Host "  opencode -m \"openrouter/openrouter/free\"" -ForegroundColor Yellow
Write-Host "  opencode run -m \"openrouter/openrouter/free\" \"Hola\"" -ForegroundColor Yellow
Write-Host "Shortcuts available: opfree, opfree_run" -ForegroundColor Yellow
