# Development Environment Strategy

This repository is the master source for AI-agent development-environment standards.

It defines how projects structure and operate their development workspace: host/container boundaries, Docker-first execution, command interfaces, repository topology, Git worktrees, parallel-agent isolation, local/CI parity, and safe environment lifecycle management.

## Scope Boundary

- `design-principles`: code design and implementation quality
- `documentation-strategy`: documentation structure and maintenance
- `development-environment-strategy`: development workspace, tooling, execution, and repository operations

## Exported Artifacts

Authoritative AI-facing guidance lives under `artifacts/`:

1. `INDEX.md` — entry point, ownership map, and task routing
2. `DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md` — WHY: safety, reproducibility, isolation, and parallel development
3. `ENVIRONMENT_STANDARDS.md` — HOW: Docker, Make, scripts, Git safety, resources, and CI parity
4. `WORKSPACE_STRUCTURE.md` — WHERE: workspace/component repositories, primary checkouts, worktrees, and top-level layout
5. `ENVIRONMENT_WORKFLOW.md` — FLOW: setup, task worktree lifecycle, validation, integration, cleanup, and recovery

Read `artifacts/INDEX.md` first.

## Japanese Guide

A readable Japanese translation of the five artifacts lives under `docs-jp/`.

Read `docs-jp/INDEX.md` first. The English files under `artifacts/` remain authoritative if the two versions differ.

## Copy to a Target Project

```bash
bash copy-environment-docs.sh path/to/target/documents/artifacts/development-environment-strategy
```

Repository-maintenance context lives under `documents/` and is not part of the exported artifact set.
