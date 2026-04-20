# Curriculum Vitae

[![Releases](https://img.shields.io/github/v/release/maximilian-hammerl/cv)](https://github.com/maximilian-hammerl/cv/releases)
![Downloads](https://img.shields.io/github/downloads/maximilian-hammerl/cv/total)
[![Top Language](https://img.shields.io/github/languages/top/maximilian-hammerl/cv)](https://github.com/maximilian-hammerl/cv/search?l=typst)

> **Disclaimer:** This repository (and the CV template repository) was created as a fun side project and should not
> be taken too seriously. It is not intended to be a particularly serious or efficient way to manage a CV — it just
> happened to be an enjoyable thing to build. Expect rough edges.

This repository contains my curriculum vitae, built with [Typst](https://typst.app) – a modern, fast
markup-based typesetting system designed as an alternative to LaTeX.

## Download

The latest versions of my CV are available in the
[Releases](https://github.com/maximilian-hammerl/cv/releases) section in both
[**German**](https://github.com/maximilian-hammerl/cv/releases/latest/download/cv-de.pdf) and
[**English**](https://github.com/maximilian-hammerl/cv/releases/latest/download/cv-en.pdf).

## Structure

- [`main.typ`](main.typ) - Main CV document
- [`compile.sh`](compile.sh) - Build script to generate the CV PDFs for all locales
- [`input/`](input/) - User-provided input files (profile, locale-specific labels and content)
  - [`input/profile.yaml`](input/profile.yaml) - Personal details (name, contact, links)
  - [`input/images/`](input/images/) - Image files (e.g. profile picture)
  - [`input/locales/`](input/locales/) - Locale-specific files, one subdirectory per locale (e.g. `en/`, `de/`)
    - `labels.yaml` - UI label strings for the locale
    - `content.yaml` - CV content for the locale (work experience, education, etc.)
- [`schemas/`](schemas/) - JSON schemas for validating the input YAML files
- [`fonts/`](fonts/) - Fonts used in the CV
- [`icons/`](icons/) - Icons used in the CV
- [`dist/`](dist/) - Generated PDFs

## Licensing

This repository uses multiple licenses:

- The Typst template and build script are licensed under the [MIT License](LICENSE-template.md). This includes:
  `main.typ`, `compile.sh`, and other generic template/build files unless noted otherwise.
- The personal CV content is not open source and is [All Rights Reserved](LICENSE-content.md). This includes: All files
  containing CV text/content such as the image files, locale files, generated files, and other personal assets.
- Fonts, icons and other third-party assets are subject to their own upstream licenses and are not relicensed by this
  repository.
