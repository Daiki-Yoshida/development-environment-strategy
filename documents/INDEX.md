# Repository Documentation Index

```yaml
document_type: "index"
target_audience: "ai_agents"
language: "english"
role: "routing hub for maintaining this repository"
index_version: "1.1.0"
last_updated_commit: "9e0af73"
last_updated_date: "2026-07-19"
```

## Scope

This `documents/` tree describes how to maintain the `development-environment-strategy` repository itself.

The authoritative guidance exported to target projects lives under `artifacts/` and has its own entry point at `../artifacts/INDEX.md`.

Readable Japanese translations live under `docs-jp/` and start at `../docs-jp/INDEX.md`. They are human-facing derivatives; `artifacts/` remains authoritative.

## Documents

```yaml
documents:
  - path: "documents/project/REPOSITORY_STRUCTURE.md"
    version: "1.1.0"
    last_updated_commit: "9e0af73"
    last_updated_date: "2026-07-19"
    purpose: "repository scope, directory ownership, artifact and translation maintenance rules"
```

## Routing

```yaml
"understanding this repository": "project/REPOSITORY_STRUCTURE.md"
"changing exported guidance": "../artifacts/INDEX.md, then the owning artifact"
"reading the Japanese guide": "../docs-jp/INDEX.md"
"updating Japanese translations": "update the matching docs-jp file after the authoritative artifact"
"copying artifacts to another project": "../copy-environment-docs.sh"
```

## Ownership Boundary

```yaml
documents: "repository-local maintenance context"
artifacts: "authoritative generic development-environment guidance exported to target projects"
docs-jp: "human-facing Japanese translations derived from artifacts; not authoritative"
README: "brief human-facing introduction"
AGENTS: "AI-agent conventions and routing"
```
