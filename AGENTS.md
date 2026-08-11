# TestOps Platform Knowledge Base

Treat this vault as a long-lived Obsidian knowledge base, not as a scratch directory.

## Start here

- Read `Home.md` and `90 System/Knowledge Base Protocol.md` before knowledge-management work.
- Read the target note and search for related notes before creating a new one.
- Ignore `.git/`, `.obsidian/`, and `.claudian/` unless the task is explicitly about configuration.
- Use Chinese by default. Preserve established English technical terms where they improve precision.

## Growth workflow

1. Capture raw or uncertain material in `00 Inbox/`.
2. Record external material in `10 Sources/` with provenance and retrieval date.
3. Distill reusable ideas into focused notes in `20 Knowledge/`.
4. Connect new notes to relevant notes and update a map in `30 Maps/`.
5. Keep active initiatives in `40 Projects/`; archive inactive material in `99 Archive/` only with user approval.

Use `$knowledge-gardener` for capture, distillation, connection, review, deduplication proposals, and map maintenance.

## Editing rules

- Prefer creating a focused note or making a small additive edit over rewriting a large existing note.
- Do not delete, rename, move, merge, or bulk-rewrite existing notes without explicit approval.
- Do not silently resolve conflicting claims. Preserve both claims, cite their sources, and mark the conflict.
- Do not invent sources, dates, decisions, quotes, or confidence. Use `confidence: low` when evidence is incomplete.
- Preserve YAML frontmatter and valid Obsidian wikilinks.
- Add only meaningful links. Do not add links solely to meet a numeric target.
- When a likely duplicate exists, write a merge proposal in `00 Inbox/` instead of merging automatically.
- Never place credentials, tokens, private keys, cookies, or environment-variable values in notes or Git.
- Treat any password or secret-looking value as sensitive even when it is labelled as an example or temporary value.
- Never stage private material with `git add .`, `git add -A`, or `git commit -a`; stage only the exact reviewed files.
- Before committing, inspect the staged diff and stop immediately if it contains a credential or secret-like value.

## Completion checks

- Confirm each new knowledge note has valid frontmatter and a clear title.
- Confirm source-dependent claims point to a source note or URL.
- Confirm new notes are reachable from at least one relevant map or project note.
- Run the configured pre-commit secret scan before every commit; never bypass it for knowledge-base content.
- Report created files, changed files, unresolved uncertainty, and suggested next actions.
