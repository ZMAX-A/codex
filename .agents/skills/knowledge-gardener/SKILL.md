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

## Interpret simple user triggers

- `整理一下`: Run the full autonomous workflow defined in `90 System/Autonomous Gardening Rules.md`, including validated exact-file Git commit and push.
- `整理一下，不提交`: Run the full workflow but leave validated changes uncommitted.
- `只检查一下`: Perform a read-only health review and report findings without changes.
- `整理一下 <path or note>`: Limit processing to the named material and directly required source, map, or project updates.

Do not require the user to mention `$knowledge-gardener` explicitly when the intent matches one of these triggers.

## Execute the workflow

1. Read the requested material, relevant map, and related notes. Search titles, aliases, and key phrases before creating a file.
2. Separate source statements from interpretation. Preserve URLs, authors, dates, and retrieval context when available.
3. Keep raw or uncertain material in `00 Inbox/`. Do not promote it solely because it sounds plausible.
4. Create a focused note only when it has a stable concept or decision. Use the templates in `90 System/Templates/` and today's date.
5. Set confidence from evidence: use `low` for unverified claims, `medium` for supported synthesis, and `high` only for direct authoritative evidence or confirmed project facts.
6. Add only links whose relationship can be explained. Update at least one relevant map or project entry so the new note is discoverable.
7. Validate frontmatter, filenames, wikilinks, source support, and accidental duplicates.
8. Summarize created files, changed files, unresolved uncertainty, and approval-required proposals.

## Complete an autonomous run

1. Require a clean Git worktree before editing. If unrelated changes already exist, stop and report them.
2. Process only Inbox notes with `processing_status: unprocessed` plus material explicitly named by the user.
3. Preserve raw Inbox text. After validation, set `processing_status: processed`, add `processed` with today's date, and list generated notes under `outputs`.
4. If evidence is insufficient, set `processing_status: blocked`, record a short non-secret blocker, and continue processing other safe items.
5. Validate frontmatter, source support, wikilinks, duplicates, filenames, and `git diff --check`.
6. For a default `整理一下` run, stage only the exact reviewed files, allow the configured secret-scanning hook to run, commit with a concise `knowledge:` message, and push to `origin/main`.
7. If validation, commit, or push fails, stop without bypassing safeguards and report the exact state.

## Guardrails

- Create and append conservatively. Preserve the user's wording and existing note structure.
- Do not delete, rename, move, merge, archive, or bulk-rewrite existing notes without explicit approval.
- Write a merge proposal in `00 Inbox/` when duplicates are likely; list similarities, differences, link impact, and the proposed canonical note.
- Preserve conflicting claims under a conflict or boundary section with separate sources.
- Do not manufacture citations or treat model output as a source.
- Do not store credentials, private keys, cookies, tokens, or environment-variable values.
- Treat password-like or secret-looking values as sensitive even when they are described as examples, temporary values, or already revoked.
- Stage only exact reviewed files. Never use catch-all Git staging commands, and never bypass a secret-scanning hook.
- If scope or evidence is insufficient, stop promotion, leave the material in Inbox, and state what is needed.
