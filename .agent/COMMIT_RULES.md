# Commit Rules

## Commit Message Style

All commits must follow strict prefixes:

- 🪚 Implement ... → for implementations and migrations
- 🔧 Fix ... → for bug fixes
- 📖 Update ... → for documentation changes

## Rules

- Never use past tense in commit messages: `Implemented` is wrong, `Implement` is correct.
- Message must describe WHAT was done, not HOW.
- Keep messages short and precise.
- One logical change per commit.
- Do not mix migration and refactoring in one commit.