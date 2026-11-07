# Development material and repository layout

The final thesis is assembled by `../main.tex` from `../manuscript/`.
Chapter and appendix files assemble their section files. All input paths are
relative to the repository root; active fragments contain a LaTeX Workshop root hint.

- `legacy/chapters/`: previous chapter versions and their existing outputs.
- `legacy/sections/` and `legacy/witt/`: material not included in the final thesis.
- `experiments/`: standalone proof attempts, calculations, scripts, and accompanying notes/PDFs.
- `reviews/`: review notes and loose review material.
- `plans/`: historical plans, the reorganization plan, and `repository-file-mapping.json`.
- `renders/`: old drafts, previews, and PDF inspection artifacts.
- `build/previous-main/`: build files retained from before the reorganization.
- `build/saved-errors/`: existing SAVE-ERROR files.
- `build/main/`: current main build intermediates and working PDF/SyncTeX files.
- `build/previews/`: generated output for development documents.

Build the thesis from the repository root:

```sh
env PATH=/Library/TeX/texbin:/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin \
  TEXMFVAR=/private/tmp/texmf-var-codex \
  /Library/TeX/texbin/latexmk -pdf -interaction=nonstopmode -file-line-error -synctex=1 main.tex
```

The resulting PDF is copied to `main.pdf` at the root. LaTeX Workshop reads the
working PDF and SyncTeX file from `development/build/main/`.

Build a standalone development document from the repository root by passing its
new path to the same command in place of `main.tex`. Its output goes to
`development/build/previews/<document-name>/`. Archived documents retain their
historical mathematical content; the reorganization updates their input,
bibliography, and main-thesis auxiliary-file paths, without repairing pre-existing
mathematical or compilation problems.

The file mapping records every original repository file's destination. Files
split into sections have several destinations. No source material was discarded.
