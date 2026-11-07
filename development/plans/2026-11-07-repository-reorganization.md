# Repository Reorganization Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement the user-approved Option 2 layout without changing the thesis content.

**Architecture:** Keep main.tex and main.pdf at the repository root. Put active sources under manuscript/, split chapter and appendix files at their existing section boundaries, and put all other working material under development/.

**Tech Stack:** LaTeX, latexmk, Biber, Python for migration and verification.

**Spec:** Option 2 filesystem tree approved in this conversation on 2026-11-07.

## Global Constraints

- Preserve mathematical text, labels, bibliography entries, and all development material.
- Keep editor and repository configuration at the root.
- Update input paths in both active sources and development documents.
- Rebuild main.pdf after source edits, preserving the original 82 pages and PDF text.
- Do not commit or push unless requested.

## Review Focus

- No original files lost or accidentally left outside manuscript/development.
- Nested inputs, especially the p-power case and ASW appendix, preserve their placement.
- Thesis chapter/appendix headings and numbering stay unchanged.
- Development standalone files can resolve shared packages, macros, and bibliography.
- Build intermediates stay under development/build while main.pdf remains at root.

## Tasks

- [x] Save all current files, hashes, extracted PDF text, and page count outside the repository.
- [x] Split active sources into the approved manuscript chapter/section layout.
- [x] Archive legacy files, experiments, reviews, plans, previews, and build files under development/; record every original file's destination.
- [x] Update input paths, editor root hints, latexmk configuration, and build instructions.
- [x] Clean-build the thesis and compare page text, labels, and numbering with the baseline.
- [x] Check development input resolution, render representative pages, and review the final layout independently.

## Execution Notes

Baseline: /private/tmp/thesis-option2-baseline/ (complete file backup and PDF text).
The approved current-workspace reorganization is performed in place; no branch, commit, or push is created.

## Verification

- All 343 original files have recorded destinations; unchanged files retain their original bytes.
- Recursively expanded active sources preserve the original content after path and whitespace normalization, including nested proof inputs.
- The clean main build succeeded and regenerated the root PDF: 82 pages, identical extracted text on every page, and unchanged numbers/pages for 248 labels.
- The root PDF matches the working PDF in development/build/main/ byte for byte.
- Rendered pages 1, 5, 16, 36, 62, and 77 have identical pixels before and after the move.
- All 85 audited literal input and bibliography paths resolve from the repository root.
- The archived lemma_88_short standalone document builds successfully into development/build/previews/lemma_88_short/.
- An independent read-only review found no critical or important issues. Its minor checklist-completion finding is resolved above.
- A final main build check succeeds with all targets up to date. The existing overfull-box warning is unrelated to this reorganization.
