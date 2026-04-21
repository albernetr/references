# 🧱 Guía de Setup Inicial — Repositorio Profesional (Repo Template Base)

## 🎯 Objetivo
Definir un repositorio base con buenas prácticas, preparado para equipo, CI/CD, seguridad y uso con Copilot.

---

## 🧭 Fase 0 — Crear repositorio

- Crear repo nuevo (NO fork)
- Nombre sugerido: repo-template-base
- Activar:
  - README
  - .gitignore
  - License

✔ Verificación:
- Repo creado correctamente
- No es fork

---

## 🧱 Fase 1 — Estructura base

.github/
  ISSUE_TEMPLATE/
  workflows/
docs/
  architecture/
  decisions/
  onboarding/
  specs/
src/
tests/

Archivos:
- README.md
- CONTRIBUTING.md
- SECURITY.md
- CODE_OF_CONDUCT.md
- CHANGELOG.md

---

## 📘 Fase 2 — Documentación

### README.md
- Propósito
- Estado
- Stack
- Setup
- Workflow
- Docs

### CONTRIBUTING.md
- Branch naming
- Validaciones antes de PR
- Reglas de PR

### SECURITY.md
- Cómo reportar vulnerabilidades
- Canal privado

---

## ⚙️ Fase 3 — Configuración GitHub

- Activar Issues
- Activar Discussions (opcional)

---

## 🧩 Fase 4 — Templates

- Issue templates (bug, feature)
- PR template
- Labels:
  - type:bug
  - type:feature
  - type:chore
  - priority:high/medium/low

---

## 👥 Fase 5 — CODEOWNERS

Ejemplo:

* @your-user
/docs/ @your-user

---

## 🔒 Fase 6 — Protección de ramas

- PR obligatorio
- Aprobaciones requeridas
- Checks obligatorios
- No force push

---

## 🔐 Fase 7 — Seguridad

Activar:
- Dependabot
- Secret scanning
- Push protection
- Code scanning

---

## ⚙️ Fase 8 — CI

Crear .github/workflows/ci.yml

- build
- lint
- test

---

## 🧠 Fase 9 — Preparación IA

Crear:

.github/copilot-instructions.md

docs/specs/

.github/skills/

---

## 🔁 Fase 10 — Template

Settings → Template repository

---

## ✅ Checklist

- Repo no es fork
- README completo
- Issues activos
- Templates creados
- CODEOWNERS
- main protegida
- CI funcionando
- Seguridad activa
- Copilot instructions
- Specs

---

## 🚀 Resultado

Repositorio profesional listo para:
- trabajo en equipo
- CI/CD
- escalabilidad
- uso con IA
