# Architecture Index

Use this file as the only routing entrypoint.

## Global Rules (ALWAYS LOAD)

- `.agent/SYSTEM_RULES.md`

`SYSTEM_RULES.md` must be loaded for every task before any task-specific routing.
Global rules are mandatory, not advisory.

## Loading Protocol

1. Load `.agent/SYSTEM_RULES.md`.
2. Classify the task.
3. Load only the mapped docs below.
4. Load skills only when implementation pattern is repeated.
5. Load templates only when scaffolding new wrappers.

## Spec Alignment

- `.agent/architecture/SPEC_ALIGNMENT.md`
- `.agent/architecture/API_DESIGN_RULES.md`
- `.agent/architecture/API_CHECKLIST.md`

Task: add Web API
-> `API_DESIGN_RULES.md`
-> `SPEC_ALIGNMENT.md`
-> `MODULES.md`
-> `API_CHECKLIST.md`

## Architecture

- `.agent/architecture/ARCHITECTURE.md`
- `.agent/architecture/MODULES.md`
- `.agent/architecture/FOUNDATION_RULES.md`
- `.agent/architecture/RUNTIME_BRIDGE.md`
- `.agent/architecture/EVENT_MODEL.md`
- `.agent/architecture/DOM_MODEL.md`
- `.agent/architecture/CSS_MODEL.md`
- `.agent/architecture/FORBIDDEN_PATTERNS.md`

## Workflow

- `.agent/WORKFLOW.md`
- `.agent/DEVELOPMENT_PHASES.md`
- `.agent/REVIEW_RULES.md`

## Context

- `.agent/CONTEXT_RULES.md`

## API Design

- `.agent/architecture/API_DESIGN_RULES.md`
- `.agent/architecture/API_CHECKLIST.md`
- `.agent/STYLE_GUIDELINES.md`

## Modules

- `.agent/architecture/MODULES.md`

## Development Rules

- `.agent/COMMIT_RULES.md`

## Skills

- `.agent/skills/dom_tree_manipulation_skill.md`
- `.agent/skills/event_handling_skill.md`
- `.agent/skills/css_composition_skill.md`
- `.agent/skills/js_bridge_skill.md`
- `.agent/skills/web_api_wrapper_skill.md`

## Templates

- `.agent/templates/dom_element_template.swift`
- `.agent/templates/css_property_template.swift`
- `.agent/templates/api_wrapper_template.swift`

## Project State

- `.agent/PROJECT_MEMORY.md`
- `.agent/TASKS.md`
- `.agent/TODO.md`
