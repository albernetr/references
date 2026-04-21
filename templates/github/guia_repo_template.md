# Guía Técnica A+ — Repo Template Base (Fusión Completa)

## Propósito
Guía técnica y operativa de nivel A+ que consolida las mejores prácticas de `Guia_flujo_completo_egantes.md` y `repo_template_expert.md`. Proporciona un runbook verificable y reproducible para crear y gobernar `repo-template-base` listo para trabajo en equipo y agentes IA.

---

## Estructura del documento
1. Resumen ejecutivo
2. Principios y gobernanza (AGENTS.md)
3. Arquitectura y componentes del flujo
4. Runbook Día 1 (pasos concretos)
5. VS Code — configuración exacta
6. Paso 4. Crear la estructura base (bloque exacto reproducible)
7. Ready for AI — archivos obligatorios, SKILLs y prompts
8. Flujo operativo completo con agentes
9. D: Pasos exactos en GitHub UI (configuración crítica)
10. Checklist de verificación exhaustivo
11. Anexos: plantillas mínimas
12. Cambios realizados

---

## 1. Resumen ejecutivo
- Objetivo: en ≤60 min disponer de un repositorio reproducible con gobernanza mínima y preparado para IA.
- Resultado mínimo entregable:
  - `README.md`, `CONTRIBUTING.md`, `SECURITY.md`, `CHANGELOG.md`, `CODE_OF_CONDUCT.md`
  - `.github/` con `copilot-instructions.md`, `CODEOWNERS`, `dependabot.yml`, `workflows/ci.yml`, `skills/`
  - `docs/specs/001-init/{spec.md,tasks.md,validation.md}`
  - Branch `main` protegida; Actions y Dependabot activados
- Verificación rápida:

```powershell
git clone <repo-url>
cd repo-template-base
Test-Path README.md; Test-Path .github\workflows\ci.yml
```

---

## 2. Principios y gobernanza (AGENTS.md)
`AGENTS.md` es la constitución del repo. Debe contener:
- Propósito y alcance del repo
- Stack y comandos para correr/validar
- Reglas operativas (preserve architecture, minimal diffs)
- Política de validación y rollback
- Referencia a `docs/specs/`

Ejemplo mínimo:
```md
# AGENTS.md
## Repository purpose
Production-grade template for scalable projects.
## Stack
- Node.js
## Rules
- Read spec before editing
- Propose plan before code change
## Validation
- npm ci
- npm test
- npm run lint
```

---

## 3. Arquitectura y componentes del flujo
- Jerarquía de verdad: `AGENTS.md` > `.github/copilot-instructions.md` > `.github/instructions/*.instructions.md` > `docs/specs/<id>/` > `.github/skills/` > prompts > custom agents
- Capas: Gobernanza (archivos permanentes), Trabajo estructurado (specs, tareas, validación), Instrucciones Copilot (repo/path/skills/prompts), Ejecución (IDE, Chat, CLI, cloud agent)
- Estructura recomendada (ver sección 6 para bloque ASCII y lista)

---

## 4. Runbook Día 1 — pasos concretos y verificables
Cada paso: Qué — Cómo (UI exacto / VS Code) — Por qué — Verificación.

**Paso 1 — Crear el repo en GitHub**
- Qué: crear `repo-template-base` (no fork).
- Cómo (UI): GitHub → **New repository** → Owner: seleccionar → Repository name: `repo-template-base` → Add README: ON → Add .gitignore: opcional → **Create repository**.
- Verificación: `git clone <repo-url>` → `Test-Path README.md` == True.

**Paso 2 — Habilitar Issues y Actions**
- Cómo (UI):
  - Issues: `Settings → General → Features → Issues` → toggle ON (Enable issues).
  - Actions: `Settings → Actions → General → Actions permissions` → seleccionar `Allow all actions and reusable workflows` → **Save**.
- Verificación: pestañas `Issues` y `Actions` visibles en la UI.

**Paso 3 — Configurar branch protection para `main`**
- Cómo (UI): `Settings → Branches → Branch protection rules → Add rule` → Branch name pattern: `main` → marcar `Require pull request reviews before merging` (1) → marcar `Require status checks to pass before merging` (seleccionar `ci` tras primera ejecución) → **Create/Save changes**.
- Verificación: regla listada; PR de prueba exige checks.

---

## 5. VS Code — configuración exacta
Objetivo: preparar VS Code para desarrollo con Copilot y para verificaciones.

Paleta de comandos (secuencia exacta)
- Abrir paleta: `Ctrl+Shift+P`
- Abrir carpeta del repo: `Ctrl+K Ctrl+O` → seleccionar la carpeta
- Settings UI: `Ctrl+Shift+P` → `Preferences: Open Settings (UI)`
- Copilot sign-in: `Ctrl+Shift+P` → `GitHub Copilot: Sign in` → seguir flujo OAuth
- Abrir Copilot Chat: `Ctrl+Shift+P` → `GitHub Copilot Chat: Open Chat`

Settings recomendados (clave exacta → valor)
- `github.copilot.enable` → `true`
- `github.copilot.chat.enabled` → `true`
- `git.enableSmartCommit` → `false`
- `telemetry.telemetryLevel` → `off` (según política)

Verificaciones visuales en VS Code
- Icono Copilot en barra de estado y notificación de sesión.
- Panel lateral "Copilot Chat" abierto.

---

## 6. Paso 4. Crear la estructura base
(Este bloque se incluye verbatim y con formato monoespaciado para garantizar visual idéntica.)

Qué hacer
En el repo, crea esta estructura. Se presenta como árbol ASCII y lista Markdown.

```text
repo-template-base/
├─ .github/
│  ├─ ISSUE_TEMPLATE/
│  ├─ CODEOWNERS
│  ├─ copilot-instructions.md
│  ├─ dependabot.yml
│  └─ workflows/
│     ├─ ci.yml
│     └─ codeql.yml
├─ docs/
│  ├─ architecture/
│  ├─ decisions/
│  ├─ onboarding/
│  └─ specs/
│     └─ 001-init/
│        ├─ spec.md
│        ├─ tasks.md
│        └─ validation.md
├─ src/
├─ tests/
├─ README.md
├─ CONTRIBUTING.md
├─ SECURITY.md
├─ CODE_OF_CONDUCT.md
└─ CHANGELOG.md
```

Lista equivalente (renderizado):
- `.github/`
  - `ISSUE_TEMPLATE/`
  - `CODEOWNERS`
  - `copilot-instructions.md`
  - `dependabot.yml`
  - `workflows/` (`ci.yml`, `codeql.yml`)
- `docs/` → `001-init/{spec.md,tasks.md,validation.md}`
- `src/`, `tests/`
- `README.md`, `CONTRIBUTING.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md`, `CHANGELOG.md`

Por qué hacerlo
- Gobernanza, trazabilidad y preparación para agentes IA.

Cómo verificar
```powershell
# desde el directorio clonado
Test-Path .github\workflows\ci.yml; Test-Path docs\specs\001-init\spec.md; Test-Path README.md
```

Notas
- Recomendado: crear localmente y push en una sola commit.
- Alternativa UI para archivos pequeños: `Code → Add file → Create new file`.

---

## 7. Ready for AI — archivos, SKILLs y prompts
Archivos obligatorios:
- `AGENTS.md` (constitución)
- `.github/copilot-instructions.md` (resumen operativo)
- `docs/specs/<id>/{spec.md,tasks.md,validation.md}` (spec-driven)
- `.github/skills/` con `implement-feature` y `fix-bug` (SKILL.md con checklist)

SKILLs: plantilla mínima
```md
---
name: implement-feature
description: Implement a feature from a spec using minimal safe diffs
---
1. Read AGENTS.md and the spec
2. Propose plan (slices)
3. Implement and include validation commands
4. Open PR referencing issue and spec
```

Prompts: patrón universal para agentes
- Context: paths and spec
- Objective: short clear goal
- Scope: what not to change
- Validation: commands to run

Ejemplo de prompt:
```
Read AGENTS.md and docs/specs/001-init/spec.md. Propose a 4-step implementation plan with validation commands.
```

---

## 8. Flujo operativo completo con agentes
Incluye: creación de issue, spec, refinamiento con Copilot, ejecución en IDE agent mode, uso de skills, apertura de PR, revisión humana. Ver detalles y ejemplos en la sección 5 de la guía de flujo.

---

## 9. D — Pasos exactos en GitHub UI (configuración crítica)
Incluye instrucciones exactas (ruta UI, qué togglear, qué debe verse) para las operaciones que requieren intervención en la web.

D.1 Habilitar Issues
- Ruta: `Settings → General → Features → Issues`
- Acción: Toggle `Enable issues` → ON
- Resultado visual esperado: pestaña `Issues` visible junto a `Code`, `Pull requests`.

D.2 Habilitar Actions y permisos
- Ruta: `Settings → Actions → General`
- Acción: `Actions permissions` → seleccionar `Allow all actions and reusable workflows` → Click **Save**
- Resultado: pestaña `Actions` activa; en `Settings → Actions` se verá el permiso establecido.

D.3 Activar Dependabot y Secret scanning
- Ruta: `Settings → Security → Code security and analysis`
- Acciones:
  - Toggle `Dependabot alerts` → ON
  - Toggle `Dependabot security updates` → ON
  - Toggle `Secret scanning` → ON
  - En `Code scanning` → Click `Set up code scanning` → elegir `CodeQL` → `Set up this workflow` → Commit the workflow file to `.github/workflows/codeql.yml`.
- Resultado visual: Sección `Code security and analysis` muestra las features ON; Dependabot Alerts listará actualizaciones cuando existan.

D.4 Configurar Branch protection (main)
- Ruta: `Settings → Branches → Branch protection rules` → Click **Add rule**
- Configuración exacta:
  - `Branch name pattern`: `main`
  - Check `Require pull request reviews before merging` → `Required approving reviewers`: 1
  - Check `Require status checks to pass before merging` → Click `Configure required status checks` → esperar a que el workflow `ci` aparezca (corre al menos una vez) → seleccionar `ci` → Save changes
- Resultado visual: la regla aparece listada y PRs muestran `Required checks`.

D.5 CODEOWNERS
- Ruta: `Code → Add file → Create new file` → path: `.github/CODEOWNERS` → pegar contenido → Commit
- Contenido ejemplo:
```
* @your-org/team-backend
/docs/ @your-org/docs-team
.github/skills/ @your-org/devex
```

D.6 Issue & PR templates (UI)
- Ruta: `Code → Add file → Create new file` → path: `.github/ISSUE_TEMPLATE/bug_report.yml` (o `feature_request.yml`) → pegar plantilla estándar → Commit.
- Para PR template: `.github/PULL_REQUEST_TEMPLATE.md` → Commit.
- Resultado: al crear Issue/PR se mostrarán las plantillas.

D.7 Labels
- Ruta: `Issues → Labels → New label` → crear `type:bug`, `type:feature`, `type:chore`, `priority:high/medium/low` → Resultado: labels listadas.

Notas de verificación de D
- Para cada cambio en Settings, comprobar el resultado visual inmediato (pestañas, secciones ON/OFF).
- Muchas opciones requieren ser Owner/Repo Admin.

---

## 10. Checklist de verificación exhaustivo
### Repositorio
- [ ] `AGENTS.md` existe
- [ ] `.github/copilot-instructions.md` existe
- [ ] `.github/instructions/` existe
- [ ] `.github/skills/` existe
- [ ] `.github/prompts/` o carpeta equivalente existe
- [ ] `docs/specs/` existe
- [ ] PR template existe
- [ ] issue templates existen
- [ ] CODEOWNERS existe
- [ ] main está protegida
- [ ] CI funciona

### Flujo
- [ ] el equipo sabe crear issues
- [ ] el equipo sabe crear specs
- [ ] el equipo sabe cuándo usar agent mode
- [ ] el equipo sabe cuándo NO delegar a un agente
- [ ] los PRs enlazan issue + spec
- [ ] se revisa arquitectura y riesgos, no solo sintaxis

### Copilot
- [ ] repository instructions funcionan
- [ ] path-specific instructions funcionan
- [ ] las skills ya cubren 2 o 3 tareas repetidas
- [ ] existe al menos un prompt reusable
- [ ] existe al menos un custom agent útil si el entorno lo soporta

#### Comandos de validación
```powershell
# Clonar y comprobar
git clone <repo-url>
cd repo-template-base
Test-Path README.md; Test-Path .github\copilot-instructions.md; Test-Path docs\specs\001-init\spec.md
# Trigger CI
git checkout -b test/ci-trigger
ni temp.txt
git add temp.txt; git commit -m "test: trigger ci"; git push -u origin test/ci-trigger
```

---

## 11. Anexos: plantillas mínimas
Incluye `AGENTS.md` ejemplo, `implement-feature/SKILL.md` plantilla, `.github/dependabot.yml` y esqueleto `ci.yml`.

Anexo A — `AGENTS.md` (ejemplo mínimo)
```md
# AGENTS.md
## Repository purpose
Production-grade template.
## Validation
- npm ci
- npm test
- npm run lint
```

Anexo B — `implement-feature/SKILL.md` (plantilla)
```md
---
name: implement-feature
description: Implement a feature from a spec using minimal safe diffs
---
1. Read AGENTS.md and spec
2. Propose plan
3. Implement in slices
4. Provide validation commands
```

Anexo C — `.github/dependabot.yml` (mínimo)
```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
```

Anexo D — `.github/workflows/ci.yml` (esqueleto)
```yaml
name: CI
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '18'
      - run: |
          if [ -f package.json ]; then npm ci; fi
      - run: |
          if npm run -s | grep -q "lint"; then npm run lint; fi
      - run: |
          if npm run -s | grep -q "test"; then npm test; fi
```
