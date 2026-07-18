# AGENTS.md

## Repository Role

This repository is the master source for generic AI-agent development-environment guidance.

The exported guidance lives in `artifacts/` and is intended to be copied or referenced by target projects.

## Read Order

1. Read `documents/INDEX.md` for repository-maintenance context.
2. Read `artifacts/INDEX.md` before changing exported guidance.
3. Follow the Ownership Map; do not duplicate rules across artifacts.

## Scope

```yaml
artifacts:
  owns: "generic guidance exported to target projects"
documents:
  owns: "documentation about maintaining this repository"
README:
  owns: "brief human-facing project description"
```

## Rules

- Keep the exported artifact set limited to `INDEX.md` plus four routed documents.
- Optimize reading through routing and ownership, not by removing load-bearing information.
- Write AI-facing artifacts and repository documents in English.
- Report to the user in the user's language.
- Keep project-specific examples out of generic artifacts unless they are clearly labeled as non-normative.
- Apply `documentation-strategy` principles: one owner per concept, link instead of duplicate, and separate repository-local documents from exported artifacts.
- Do not modify target projects from this repository.
- Do not commit or push unless explicitly requested.
- Use a branch for changes when the default branch already exists.

## Artifact Domains

- `DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md`: WHY
- `ENVIRONMENT_STANDARDS.md`: HOW
- `WORKSPACE_STRUCTURE.md`: WHERE
- `ENVIRONMENT_WORKFLOW.md`: FLOW
- `INDEX.md`: routing and ownership only

When a rule appears to fit several files, place it in the file that owns its primary question and use a one-sentence cross-reference elsewhere.
