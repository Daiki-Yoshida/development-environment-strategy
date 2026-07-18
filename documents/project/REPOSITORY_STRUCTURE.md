# Repository Structure

```yaml
document_type: "repository_structure"
target_audience: "ai_agents"
language: "english"
document_version: "1.0.0"
last_updated_commit: "994ab4d"
last_updated_date: "2026-07-19"
```

## Purpose

This repository maintains a compact, generic artifact set for evaluating and designing AI-agent development environments.

It is a sibling of:

- `design-principles`, which evaluates code design;
- `documentation-strategy`, which evaluates documentation management.

## Directory Ownership

```yaml
artifacts:
  role: "exported AI-facing guidance for target projects"
  rule: "generic and project-independent"
documents:
  role: "AI-facing context for maintaining this repository"
  rule: "never copied as part of the exported artifact set"
README.md:
  role: "brief human-facing introduction"
AGENTS.md:
  role: "AI-agent entry point and repository conventions"
copy-environment-docs.sh:
  role: "copies exported Markdown artifacts to a target directory"
```

## Exported Artifact Shape

The artifact set is intentionally limited to five files:

```yaml
INDEX.md: "routing and ownership"
DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md: "WHY"
ENVIRONMENT_STANDARDS.md: "HOW"
WORKSPACE_STRUCTURE.md: "WHERE"
ENVIRONMENT_WORKFLOW.md: "FLOW"
```

Do not add a sixth artifact merely because a technology has many rules. Add a section to the owning document first.

Split the artifact set only when one file clearly owns multiple independent questions and task routing can reliably avoid loading both. A split is a structural change and should be discussed before implementation.

## Content Rules

- Keep generic artifacts independent of a specific project, language, cloud provider, or engine.
- Use project-specific repositories as evidence, not as normative names or paths.
- State rules through short prose, lists, and YAML when structure matters.
- Do not repeat a rule across files; use the ownership map and cross-references.
- Preserve load-bearing semantics even when reducing token use.
- Put rationale in Philosophy, normative implementation rules in Standards, placement in Structure, and sequence/confirmation in Workflow.

## Maintenance Flow

1. Read `artifacts/INDEX.md` and identify the owning document.
2. Update only the owner unless routing also changes.
3. Check sibling artifacts for duplication or contradiction.
4. Verify links and filenames.
5. Confirm the exported set still contains exactly the intended files.
6. Update repository-local documentation only when repository maintenance behavior changes.

## Scope Guard

This repository does not own:

- application architecture;
- documentation-tree strategy;
- pull-request approval workflow;
- release governance;
- project-specific Dockerfiles, Makefiles, scripts, or worktree commands.

It defines evaluation principles and standards that target projects apply through their own project documentation and tooling.
