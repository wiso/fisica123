![example workflow](https://github.com/wiso/fisica123/actions/workflows/build_latex.yml/badge.svg)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/wiso/fisica123)
![GitHub Release Date](https://img.shields.io/github/release-date/wiso/fisica123)

Latest release: https://github.com/wiso/fisica123/releases/latest/download/fisica.pdf

Per ogni pull request la CI produce anche un PDF con le differenze evidenziate
(latexdiff), scaricabile come artefatto `latexdiff-pdf` dalla pagina della
GitHub Action.
Il workflow si trova in `ci/latexdiff.yml` e va spostato in
`.github/workflows/latexdiff.yml` per attivarlo.
