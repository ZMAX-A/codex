---
name: knowledge-gardener
description: Maintain and grow this Obsidian vault by capturing raw material, creating source notes, distilling atomic knowledge, adding meaningful wikilinks, updating maps of content, and reviewing duplicates, conflicts, or stale notes. Use for inbox processing, note gardening, knowledge extraction, research synthesis, connection reviews, MOC maintenance, and knowledge-base health checks.
---

# Knowledge Gardener

Grow the vault through small, sourced, reversible changes. Follow `AGENTS.md` and read `90 System/Knowledge Base Protocol.md` before editing knowledge files.

## Choose the operation

- **Capture**: Preserve raw input and provenance in `00 Inbox/`.
- **Source**: Create a source note in `10 Sources/` for external material.
- **Distill**: Extract reusable single-idea notes into `20 Knowledge/`.
- **Connect**: Add explanatory wikilinks and update a relevant map in `30 Maps/`.
- **Apply**: Link stable knowledge into an active note in `40 Projects/`.
- **Review**: Find orphans, likely duplicates, unsupported claims, conflicts, and stale notes.

## Execute the workflow

1. Read the requested material, relevant map, and related notes. Search titles, aliases, and key phrases before creating a file.
2. Separate source statements from interpretation. Preserve URLs, authors, dates, and retrieval context when available.
3. Keep raw or uncertain material in `00 Inbox/`. Do not promote it solely because it sounds plausible.
4. Create a focused note only when it has a stable concept or decision. Use the templates in `90 System/Templates/` and today's date.
5. Set confidence from evidence: use `low` for unverified claims, `medium` for supported synthesis, and `high` only for direct authoritative evidence or confirmed project facts.
6. Add only links whose relationship can be explained. Update at least one relevant map or project entry so the new note is discoverable.
7. Validate frontmatter, filenames, wikilinks, source support, and accidental duplicates.
8. Summarize created files, changed files, unresolved uncertainty, and approval-required proposals.

## Guardrails

- Create and append conservatively. Preserve the user's wording and existing note structure.
- Do not delete, rename, move, merge, archive, or bulk-rewrite existing notes without explicit approval.
- Write a merge proposal in `00 Inbox/` when duplicates are likely; list similarities, differences, link impact, and the proposed canonical note.
- Preserve conflicting claims under a conflict or boundary section with separate sources.
- Do not manufacture citations or treat model output as a source.
- Do not store credentials, private keys, cookies, tokens, or environment-variable values.
- If scope or evidence is insufficient, stop promotion, leave the material in Inbox, and state what is needed.

