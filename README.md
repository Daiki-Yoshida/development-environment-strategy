# Development Environment Strategy

This repository is the master source for AI-agent development-environment standards.

It defines how projects structure and operate their development workspace: host/container boundaries, Docker-first execution, command interfaces, repository topology, Git worktrees, parallel-agent isolation, local/CI parity, and safe environment lifecycle management.

The exported AI-facing guidance lives under `artifacts/`.

## Scope Boundary

- `design-principles`: code design and implementation quality
- `documentation-strategy`: documentation structure and maintenance
- `development-environment-strategy`: development workspace, tooling, execution, and repository operations

## Planned Artifact Set

1. `INDEX.md` — entry point, ownership map, and task routing
2. `DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md` — WHY: safety, reproducibility, isolation, and parallel development
3. `ENVIRONMENT_STANDARDS.md` — HOW: Docker, Make, scripts, Git safety, resources, and CI parity
4. `WORKSPACE_STRUCTURE.md` — WHERE: workspace/component repositories, primary checkouts, worktrees, and top-level layout
5. `ENVIRONMENT_WORKFLOW.md` — FLOW: setup, task worktree lifecycle, validation, integration, cleanup, and recovery
