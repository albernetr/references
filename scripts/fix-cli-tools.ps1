# fix-cli-tools.ps1
# Instala y configura opencode, codex y claude code en Windows
# Uso: .\fix-cli-tools.ps1

$npmGlobalBin = "$env:APPDATA\npm"

# ─────────────────────────────────────────────
# 1. Agregar npm global bin al PATH del usuario
# ─────────────────────────────────────────────
$currentPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")
if ($currentPath -notlike "*$npmGlobalBin*") {
    [System.Environment]::SetEnvironmentVariable("PATH", "$currentPath;$npmGlobalBin", "User")
    Write-Host "[OK] PATH actualizado con: $npmGlobalBin" -ForegroundColor Green
} else {
    Write-Host "[INFO] $npmGlobalBin ya estaba en PATH." -ForegroundColor Cyan
}

# Aplicar en la sesion actual
$env:PATH += ";$npmGlobalBin"

# ─────────────────────────────────────────────
# 2. Instalar paquetes globales
# ─────────────────────────────────────────────
$packages = @(
    @{ Name = "opencode";     Pkg = "opencode-ai" },
    @{ Name = "codex";        Pkg = "@openai/codex" },
    @{ Name = "claude";       Pkg = "@anthropic-ai/claude-code" }
)

foreach ($tool in $packages) {
    Write-Host "`n[...] Instalando $($tool.Pkg)..." -ForegroundColor Yellow
    npm install -g $tool.Pkg
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] $($tool.Pkg) instalado." -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Fallo al instalar $($tool.Pkg)." -ForegroundColor Red
    }
}

# ─────────────────────────────────────────────
# 3. Verificar versiones
# ─────────────────────────────────────────────
Write-Host "`n============ Verificacion ============" -ForegroundColor Magenta
foreach ($tool in $packages) {
    $version = & $tool.Name --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] $($tool.Name): $version" -ForegroundColor Green
    } else {
        Write-Host "[WARN] $($tool.Name) no responde. Abre una nueva terminal e intenta de nuevo." -ForegroundColor Yellow
    }
}

Write-Host "`n[LISTO] Abre una nueva terminal para que todos los cambios de PATH surtan efecto." -ForegroundColor Cyan
