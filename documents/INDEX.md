# Repository Documentation Index

```yaml
document_type: "index"
target_audience: "ai_agents"
language: "english"
role: "routing hub for maintaining this repository"
index_version: "1.0.0"
last_updated_commit: "436c0b6"
last_updated_date: "2026-07-19"
```

## Scope

This `documents/` tree describes how to maintain the `development-environment-strategy` repository itself.

The guidance exported to target projects lives under `artifacts/` and has its own entry point at `../artifacts/INDEX.md`.

## Documents

```yaml
documents:
  - path: "documents/project/REPOSITORY_STRUCTURE.md"
    version: "1.0.0"
    last_updated_commit: "994ab4d"
    last_updated_date: "2026-07-19"
    purpose: "repository scope, directory ownership, and artifact maintenance rules"
```

## Routing

```yaml
"understanding this repository": "project/REPOSITORY_STRUCTURE.md"
"changing exported guidance": "../artifacts/INDEX.md, then the owning artifact"
"copying artifacts to another project": "../copy-environment-docs.sh"
```

## Ownership Boundary

```yaml
documents: "repository-local maintenance context"
artifacts: "generic exported development-environment guidance"
README: "brief human-facing introduction"
AGENTS: "AI-agent conventions and routing"
```
