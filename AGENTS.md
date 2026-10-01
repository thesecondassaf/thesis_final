# Repository instructions

## PDF rendering

After every edit to a thesis source file (`.tex`, `.bib`, or a file containing
LaTeX macros), rebuild `main.pdf` before finishing the task. Use the same build
configured for LaTeX Workshop:

```sh
env \
  PATH=/usr/local/texlive/2026basic/bin/universal-darwin:/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin \
  TEXMFVAR=/private/tmp/texmf-var-codex \
  /usr/local/texlive/2026basic/bin/universal-darwin/latexmk \
  -pdf -interaction=nonstopmode -file-line-error -synctex=1 main.tex
```

Confirm that the build succeeds and that `main.pdf` was regenerated. If the
build fails, diagnose the error and do not describe the edit as verified.
