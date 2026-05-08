# lang-cheatsheets

Side-by-side reference PDFs anchored on Java syntax. For a Java dev who already
maps constructs in their head and just wants to see "what does *this* look like in
Python / Go / TypeScript?" without reading a 40-page tutorial.

## PDFs

- [`pdf/java-vs-python.pdf`](pdf/java-vs-python.pdf)
- [`pdf/java-vs-go.pdf`](pdf/java-vs-go.pdf)
- [`pdf/java-vs-typescript.pdf`](pdf/java-vs-typescript.pdf)

Each cheatsheet covers: program entry, variables, primitives, strings, control
flow, loops, collections, functions, classes / structs, generics, error handling,
modules, concurrency, and a "common gotchas" appendix.

## Building locally

Requires a TeX Live install with `xelatex`, `listings`, `geometry`, `fontspec`,
`hyperref`, `microtype`, `underscore`, `enumitem`, `parskip`, `fancyhdr`. (TeX
Live 2025basic on macOS has all of these.)

```bash
./build.sh
```

Outputs land in `pdf/`. `build.sh` runs `xelatex` twice per `.tex` to settle
the `hyperref` page-labels cache, then cleans up aux files.

## Layout

- `cheatsheet-style.sty` — shared style: layout, colors, listings styles for
  Java / Python / Go / TypeScript, plus the `\construct{Title}` macro that
  draws the colored title bar above each side-by-side pair.
- `java-vs-{python,go,typescript}.tex` — one source file per cheatsheet. All
  three share the same section ordering so you can flip between them.
- `build.sh` — build script.
- `pdf/` — committed PDFs (so the repo's preview-on-GitHub experience works
  without a TeX install).

## Editing

The repeating pattern inside each `.tex` is:

```tex
\begin{construct}{Section title}
\noindent
\begin{minipage}[t]{0.485\linewidth}
\begin{lstlisting}[style=java, title=Java]
... Java code ...
\end{lstlisting}
\end{minipage}\hfill
\begin{minipage}[t]{0.485\linewidth}
\begin{lstlisting}[style=python, title=Python]
... target code ...
\end{lstlisting}
\end{minipage}
\end{construct}
```

Available styles: `java`, `python`, `go`, `ts`.

## License

Personal study notes. No license attached --- treat as all-rights-reserved.
