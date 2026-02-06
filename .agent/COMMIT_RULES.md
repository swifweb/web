# Commit Rules

Git, staging, commit-message, and history-safety rules for SwifWeb.

## Pre-Work Check

Before any repository mutation, inspect the full working-tree baseline:

```bash
git status --short --untracked-files=all
```

When working through a repository tool instead of a shell, obtain the equivalent full staged/unstaged/untracked status.

Record enough baseline detail to distinguish pre-existing user work from task-created changes.

## Post-Work Check

After implementation and before declaring the task complete:

1. inspect the same full status again;
2. inspect the exact task diff;
3. confirm only approved task paths were intentionally changed;
4. confirm unrelated staged, unstaged, and untracked work remains untouched.

A dirty repository is not permission to absorb existing changes into the task.

## Preservation Rules

- Preserve unrelated staged, unstaged, and untracked files exactly as found.
- Never stage or unstage unrelated changes.
- Never amend, squash, reset, checkout/restore files, clean, stash, delete, rename, overwrite, or otherwise rewrite user work unless explicitly requested for the exact operation and scope.
- Do not use destructive Git operations as a shortcut for isolating the task diff.
- Do not add coding-agent attribution to source headers, commit subjects, commit bodies, trailers, or co-author metadata.

## Conflict Detection

If an approved task path contains unexpected overlapping edits that cannot be safely distinguished from the requested change, stop that mutation path and report the conflict instead of overwriting or normalizing the user's work.

Do not silently replace a pre-existing version of an approved file merely because the task also needs to edit that file.

## Scope Safety

Every task has an explicit writable path scope before mutation.

Task approval permits only the requested task work inside that scope. It does not authorize unrelated formatting, cleanup, generated-file refreshes, neighboring refactors, or Git operations.

Do not add, edit, delete, rename, format, stage, unstage, revert, or otherwise touch files outside the approved task scope unless the maintainer explicitly expands the scope.

Prior task scopes do not carry forward automatically.

## Commit Authorization

Implementation approval is not commit authorization.

- Never create a commit unless the maintainer explicitly requests a commit.
- An explicit commit request does not by itself authorize staging or unstaging. Staging remains a separate Git operation and must be explicitly authorized for the exact paths/scope, consistent with root `AGENTS.md`.
- Never include unrelated pre-existing changes in an authorized commit.
- Use one logical change per commit. Do not combine independent implementation, migration, cleanup, or documentation changes merely to reduce commit count.
- Before committing, inspect the exact staged file set and staged diff, then re-check repository status.
- If the staged diff contains anything outside the authorized commit scope, correct the staging before committing.

Transient `.artifacts/**` evidence is not part of normal product/history commits. Include it only when the maintainer explicitly asks to commit those artifacts.

## Push and History Authorization

Commit authorization does not authorize a push.

- Never push unless the maintainer explicitly requests a push.
- Never force-push unless the maintainer explicitly requests that exact operation.
- Never amend, rebase, squash, reset, or otherwise rewrite existing history unless explicitly authorized for the exact branch and operation.
- A successful audit or merge-ready verdict does not itself authorize integration, history rewriting, or push.

## Commit Message Style

Follow the repository's actual history: **semantic emoji + concise imperative English**.

The emoji communicates the kind or character of the change; the words state what the commit does. Do not impose a fixed three-prefix taxonomy when the repository history uses a broader vocabulary.

Good repository-native patterns include:

- `🪚 Isolate DOM singletons and helpers to @MainActor`
- `🪚 Redesign Dispatch: actor → @MainActor enum with @MainActor closures`
- `🔧 Remove unsound Sendable conformance from Storage`
- `🪛 Event: fix timestamp behavior`
- `🎨 CSSRule: improve property serialization`
- `📖 Update Readme`

These are examples, not a closed emoji-to-verb table.

### Emoji Guidance

Normal maintainer-authored local commits use **exactly one leading semantic emoji** followed by the English subject.

Prefer emoji already established by relevant SwifWeb history. Examples include:

- `🪚` for implementation, migration, isolation, or substantial structural work;
- `🪛` for focused API/module adjustments and small targeted refactors;
- `🎨` for CSS/style-oriented work;
- `🛠` or `🔧` for fixes and maintenance, choosing whichever best matches nearby history;
- `📖` for README/documentation work;
- `💡` for API additions or API-shape changes;
- `🚦` for routing-related work.

This list is descriptive, not exhaustive. Do not invent a new repository-wide emoji taxonomy when recent relevant history already provides a suitable convention.

For a **new test-only commit**, `🧪` is an accepted modern semantic extension. Treat it as a current convention for test-only work, not as evidence that `🧪` was historically established in SwifWeb.

Do not copy emoji conventions from another repository merely because they are valid there. Repository-local history wins.

### Subject Rules

- Write the subject in concise, action-oriented imperative English.
- Use exactly one leading semantic emoji for ordinary local commits.
- Do **not** use Conventional Commit prefixes such as `feat:`, `fix:`, `chore:`, `refactor:`, or `docs:` by default. SwifWeb's native style is semantic emoji + English action, not Conventional Commits.
- Prefer the most precise verb for the actual change: `Add`, `Fix`, `Improve`, `Implement`, `Isolate`, `Redesign`, `Remove`, `Restore`, `Update`, and similar imperative verbs are all valid when accurate.
- Do not force `Implement`, `Fix`, or `Update` when another verb describes the change better.
- An optional scope through `:` is encouraged when it improves precision, for example `DOM: ...`, `Event: ...`, or `WebApp: ...`.
- Wrap Swift/API symbols, type names, method names, property names, enum cases, and other literal code identifiers in backticks when they are used as symbols in the subject, for example `` `RequestOptions` `` or `` `renderPreview()` ``.
- Do not prefix the subject with `SwifWeb:` or `web:` merely to repeat the repository name.
- Keep the subject focused on what changed, not a low-level implementation diary.
- Do not use past tense such as `Implemented`, `Fixed`, or `Updated`.
- Do not generate contributor-integration suffixes such as `(#14 by @username)`, `by @username`, PR-number suffixes, or similar attribution for ordinary maintainer-authored local commits. Historical occurrences belong to integrated contributor/PR changes and are not the default local commit format.
- Do not add agent/model/tool attribution such as `Generated by Luna-Max`, `Co-authored-by ChatGPT`, model names, tool names, generated-by wording, or artificial co-author trailers.

When choosing between multiple reasonable emoji/wording options, prefer the convention visible in the most recent relevant SwifWeb commits rather than inventing a new repository-wide taxonomy.

## Commit Bodies

A subject-only commit is acceptable when it is self-explanatory, which is common in SwifWeb history.

Use a commit body only when non-obvious rationale, compatibility constraints, or migration context materially helps future readers. Keep the body factual and avoid duplicating transient execution logs or `.artifacts/**` reports.
