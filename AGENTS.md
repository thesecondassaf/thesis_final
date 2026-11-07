# Repository instructions

## PDF rendering

After every edit to a thesis source file (`.tex`, `.bib`, or a file containing
LaTeX macros), rebuild `main.pdf` before finishing the task. Use the same build
configured for LaTeX Workshop:

```sh
env \
  PATH=/Library/TeX/texbin:/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin \
  TEXMFVAR=/private/tmp/texmf-var-codex \
  /Library/TeX/texbin/latexmk \
  -pdf -interaction=nonstopmode -file-line-error -synctex=1 main.tex
```

Confirm that the build succeeds and that `main.pdf` was regenerated. If the
build fails, diagnose the error and do not describe the edit as verified.

## Repository layout

- `main.tex` assembles the final thesis; `main.pdf` is the final output at the root.
- Active LaTeX sources are in `manuscript/`, organized by chapter and section.
- `development/` contains legacy sources, experiments, reviews, plans, renders, and build files.
- Run builds from the repository root. `.latexmkrc` puts intermediate files in
  `development/build/main/` and copies the final PDF to `main.pdf`.
- LaTeX Workshop uses the build PDF and SyncTeX data in `development/build/main/`.
- Preserve the distinction between active manuscript files and development material.
