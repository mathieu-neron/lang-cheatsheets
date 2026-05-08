#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

mkdir -p pdf

for tex in java-vs-python.tex java-vs-go.tex java-vs-typescript.tex; do
  echo ">>> Building $tex"
  xelatex -halt-on-error -interaction=nonstopmode "$tex" >/dev/null
  xelatex -halt-on-error -interaction=nonstopmode "$tex" >/dev/null
done

mv java-vs-*.pdf pdf/ 2>/dev/null || true
rm -f *.aux *.log *.out *.toc *.synctex.gz *.fls *.fdb_latexmk

echo ">>> Done. PDFs in ./pdf/"
ls -lh pdf/
