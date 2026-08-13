# Public Content Ideas

Stable low-context workflow owner for preserving high-value candidate material discovered during SwifWeb research, architecture, implementation, validation, corrections, and audits that may later be useful for README examples, public website/documentation, migration guides, release notes, technical articles, short posts, diagrams, or compelling user-facing explanations.

This is an **idea bank, not normal development context and not product truth**. Detailed entries live in focused thematic shards under `.agent/public-content-ideas/` so ordinary development does not pay their context cost.

## Why This Exists

Useful public explanations are often easiest to see while the implementation reasoning, source evidence, compatibility constraint, or validation result is still fresh.

Good material can otherwise be expensive to rediscover later, for example:

- a concise before/after API example;
- an explanation of why a wrapper preserves a browser semantic instead of hiding it;
- a migration or compatibility story;
- a diagram that makes a bridge/lifetime rule understandable;
- a validation result that meaningfully increases trust;
- an implementation/correction story with real engineering value;
- a small code example that demonstrates a capability better than a later repository search could.

Capture the useful seed now. Publication and polishing happen later only when the maintainer explicitly asks for them.

## Mandatory Cheap Capture Check

After meaningful research, architecture/design, implementation, validation, correction, audit, or an accepted checkpoint, the coordinator/reviewer asks **from information already in current context**:

> Did this work produce a genuinely valuable public-facing example, capability, explanation, migration note, validation result, or publication angle that would be wasteful to rediscover later?

If **no**:

- do nothing;
- do not open this router;
- do not browse any shard "just in case".

If **yes**:

1. open this compact router;
2. open only the single relevant thematic shard;
3. append the smallest useful entry while reasoning/evidence is fresh;
4. record truthful status and publication caveat;
5. continue normal work without loading unrelated shards.

An explicit README/public-docs/website-docs/migration/release/article/post/curation task may load the router and relevant shard(s) directly.

## Context-Budget Rule

`PUBLIC_CONTENT_IDEAS.md` and `.agent/public-content-ideas/**` are **zero-by-default lazy communication context**.

They do not consume architecture-owner slots, but that does not make them free to browse. Do not load them during ordinary development unless the capture check is positive or the current task explicitly concerns public content.

Never bulk-load all shards. Read this router, then only the relevant shard(s).

## Lifecycle vs `.artifacts/NEW_CHAT.md`

The two mechanisms intentionally have different lifecycles:

- `.artifacts/NEW_CHAT.md` is transient, disposable continuation context and may be reconstructed from stable docs + Git + actual source;
- this router and its shards are durable, versioned `.agent/**` candidate communication material.

The idea bank must never become an alternate implementation log, task tracker, architecture owner, or source of release truth.

## Current Shards

- `public-content-ideas/WEB_API_DESIGN_AND_ERGONOMICS.md` — canonical Web semantics, additive Swift ergonomics, API wrapper examples, package-layer explanations, and compatibility/UX stories.
- `public-content-ideas/CONCURRENCY_AND_JS_BRIDGE.md` — MainActor isolation, JavaScript bridge/lifetime safety, Sendable corrections, browser-state ownership, and related engineering/migration stories.

Create a new shard only when a topic is independently valuable enough that placing it in an existing shard would create context noise. Prefer stable thematic files over one file per tiny idea. Do not pre-create empty shards.

## Entry Contract

Keep entries compact. Use this shape when useful:

```text
## Short descriptive title

Status: idea | architecture-approved | implemented | validated | shipped | superseded
Good for: README | website docs | migration guide | release notes | article | short post

### Why users should care
User/developer value, not task bookkeeping.

### Candidate example / visual
Small code snippet, before/after, diagram, or key facts worth preserving.

### Evidence / provenance
Stable owner, source/test/browser/native evidence, and/or meaningful commit when useful.

### Publication caveat
What future writers must not overclaim.
```

Sections may be omitted when they add no value, but **status is always required, and publication caveat is mandatory for anything not `shipped`**.

## Status Discipline

Use lifecycle status truthfully:

- `idea` — worth preserving, not approved design or implementation truth;
- `architecture-approved` — accepted stable design, not necessarily implemented or released;
- `implemented` — current source exists, but validation/release may still be pending;
- `validated` — the relevant repository/browser/native validation gate has passed;
- `shipped` — verified part of an actual released/publicly supported version;
- `superseded` — retained only when the older idea still has migration/historical/publication value.

Never describe `idea`, `architecture-approved`, `implemented`, or merely `validated` behavior as released unless release status is separately verified.

## What to Capture

Strong candidates include:

- README-sized examples that expose a useful capability quickly;
- diagrams that explain layers, bridge ownership, event/lifetime behavior, or data flow;
- before/after API snippets;
- source-compatibility and migration insights;
- browser/native validation results with a meaningful correctness story;
- surprising specification behavior worth explaining;
- user-facing feature explanations;
- engineering stories about why a design/correction matters;
- article/post angles that depend on reasoning likely to be forgotten later.

## What Not to Capture

Do not fill the bank with:

- routine refactors with no user/engineering story;
- generic praise or marketing adjectives;
- task bookkeeping/status diaries;
- raw test counts without a meaningful correctness story;
- ordinary compiler fixes;
- duplicated architecture rules;
- transient failures/logs that belong in `.artifacts/**`;
- speculative claims presented as capabilities.

## Publication, Promotion, and Cleanup

Publication remains maintainer-controlled.

Only with explicit maintainer approval may future work:

- promote an entry into `README.md`;
- promote it into public website/docs sources;
- turn it into migration or release-note material;
- use it as an article/post outline;
- consolidate/deduplicate shards;
- mark entries superseded;
- remove entries after curation.

Do not automatically publish, rewrite public docs, or delete an idea merely because it was captured or used once. The same material may be useful for several channels.
