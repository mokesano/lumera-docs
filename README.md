# 📚 Lumera Documentation Hub

[![Nextra](https://img.shields.io/badge/docs-nextra-0077cc?logo=github)](https://github.com/shuding/nextra)
[![License](https://img.shields.io/github/license/mokesano/lumera-docs)](LICENSE)
[![Status](https://img.shields.io/badge/status-active-brightgreen)](#)

> **Centralized documentation hub** for the Lumera ecosystem — built with [Nextra](https://nextra.site), a modern static documentation builder that produces lightweight, runtime-free assets [[1]].

---

## 🎯 Overview

This repository serves as the **single source of truth** for all documentation across the Lumera application suite. It aggregates, organizes, and publishes technical documentation from multiple projects into one unified, searchable interface.

### ✨ Why Nextra?

- **Static & Fast**: Generates optimized static assets — no runtime dependencies, just pure HTML/CSS/JS [[19]]
- **Markdown-First**: Write guides in standard Markdown with rich content support (images, tables, code blocks)
- **API Blueprint Support**: Document REST APIs using API Blueprint syntax
- **Built-in Search**: Local search index generated at build time — no external services required
- **Dark Mode + Responsive**: Works seamlessly across desktop, tablet, and mobile
- **SEO & Sharing Ready**: Auto-generated sitemaps, Open Graph tags, and preview images
- **Private Pages**: Prefix files with `_` to create unlisted or internal documentation

---

## 🗂️ Documented Projects

| Repository | Description | Documentation Path |
|------------|-------------|-------------------|
| [wizdam-apis](https://github.com/mokesano/wizdam-apis) | Core API services & endpoints | `/references/wizdam-apis/` |
| [wizdam-sikola](https://github.com/mokesano/wizdam-sikola) | Educational platform module | `/guides/wizdam-sikola/` |
| [sdgs-mapper](https://github.com/mokesano/sdgs-mapper) | SDG mapping & alignment tools | `/guides/sdgs-mapper/` |
| [SDGs-analytics](https://github.com/mokesano/SDGs-analytics) | Analytics engine for SDG metrics | `/references/sdgs-analytics/` |
| [lumera-edge](https://github.com/mokesano/lumera-edge) | Edge computing & integration layer | `/guides/lumera-edge/` |

> 💡 **Structure Convention**:  
> - `guides/` → User-facing tutorials, conceptual guides, workflows  
> - `references/` → API specs, technical references, configuration details  
> - `changes/` → Changelogs per project (auto-published as RSS feed)

---

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ (LTS recommended)
- npm or pnpm

### Local Development

```bash
# 1. Clone and install dependencies
git clone https://github.com/mokesano/lumera-docs.git
cd lumera-docs
npm install

# 2. Start local preview server (with hot-reload)
npm run dev

# 3. Open in browser
# → http://localhost:8080
```

### Build for Production

```bash
# Generate static assets to ./out
npm run build

# Deploy ./out to your static host:
# - GitHub Pages, Cloudflare Pages, Netlify, Vercel, or any S3/HTTP server
```

---

## 📁 Repository Structure

```
lumera-docs/
├── data/
│   ├── guides/                 # User guides & tutorials
│   │   ├── wizdam-sikola/
│   │   ├── sdgs-mapper/
│   │   └── lumera-edge/
│   ├── references/             # API & technical references
│   │   ├── wizdam-apis/
│   │   └── sdgs-analytics/
│   ├── changes/                # Changelogs (auto-RSS)
│   │   ├── wizdam-apis.md
│   │   └── ...
│   └── index.md                # Homepage content
├── public/                     # Static assets (images, custom CSS/JS)
├── next.config.js                 # Nextra configuration
├── package.json
├── README.md
└── .github/workflows/          # CI/CD: auto-build on push
```

---

## ✍️ Writing Documentation

### Guide Example (`data/guides/wizdam-sikola/getting-started.md`)

```markdown
---
title: Getting Started with Wizdam Sikola
description: Quick setup guide for educators
order: 1
---

## Installation

```bash
npm install @wizdam/sikola
```

## Basic Usage

```php
<?php
$sikola = new Sikola(['env' => 'production']);
$sikola->initialize();
```

> 💡 **Tip**: Use `>` blockquotes for callouts. Nextra renders them with distinct styling.
```

### API Reference Example (`data/references/wizdam-apis/v1.apib`)

```apib
# Group Authentication

## Login [/auth/login]

### POST

+ Request (application/json)
    {
      "username": "user@example.com",
      "password": "••••••••"
    }

+ Response 200 (application/json)
    {
      "token": "eyJhbGciOiJIUzI1NiIs..."
    }
```

### Changelog Entry (`data/changes/wizdam-apis.md`)

```markdown
---
project: wizdam-apis
version: 2.4.0
date: 2026-05-13
---

## [2.4.0] - 2026-05-13

### Added
- New `/sdgs/align` endpoint for batch SDG mapping
- PHP 8.4 type safety annotations

### Fixed
- Rate limiting edge case in high-concurrency scenarios
```

---

## ⚙️ Configuration (`next.config.js`)

```json
{
  "name": "Lumera Documentation",
  "description": "Unified technical documentation for the Lumera ecosystem",
  "url": "https://developer.sangia.org",
  "theme": {
    "accent": "#2563eb",
    "logo": "/public/logo.svg",
    "favicon": "/public/favicon.ico"
  },
  "search": {
    "enabled": true,
    "indexContent": true
  },
  "rss": {
    "enabled": true,
    "title": "Lumera Changelog",
    "description": "Latest updates across all Lumera projects"
  },
  "projects": [
    { "name": "Wizdam APIs", "path": "wizdam-apis", "repo": "https://github.com/mokesano/wizdam-apis" },
    { "name": "Wizdam Sikola", "path": "wizdam-sikola", "repo": "https://github.com/mokesano/wizdam-sikola" },
    { "name": "SDGs Mapper", "path": "sdgs-mapper", "repo": "https://github.com/mokesano/sdgs-mapper" },
    { "name": "SDGs Analytics", "path": "sdgs-analytics", "repo": "https://github.com/mokesano/SDGs-analytics" },
    { "name": "Lumera Edge", "path": "lumera-edge", "repo": "https://github.com/mokesano/lumera-edge" }
  ]
}
```

---

## 🔄 Syncing with Source Repositories

To keep documentation in sync with upstream repositories:

### Option 1: Git Submodules (Recommended)
```bash
# Add each repo as a submodule under data/
git submodule add https://github.com/mokesano/wizdam-apis.git data/references/wizdam-apis-src
git submodule update --init --recursive
```

### Option 2: CI-Driven Sync (GitHub Actions)
See `.github/workflows/sync-docs.yml` for automated pulls from source repos on schedule.

### Option 3: Manual Sync Script
```bash
# scripts/sync-all.sh
#!/bin/bash
for repo in wizdam-apis wizdam-sikola sdgs-mapper SDGs-analytics lumera-edge; do
  echo "🔄 Syncing $repo..."
  git -C "data/references/$repo-src" pull origin main
done
```

> ✅ **Best Practice**: Store only *documentation-specific* files in this repo. Link to source code, but keep API specs, guides, and changelogs here for centralized versioning.

---

## 🌐 Deployment

### GitHub Pages (Simple)
```yaml
# .github/workflows/deploy.yml
name: Deploy Docs
on:
  push:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 18 }
      - run: npm ci
      - run: npm run build
      - uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./out
```

### Cloudflare Pages / Netlify / Vercel
Point your static host to the `./out` directory after `npm run build`. All platforms support automatic deploys on `main` branch push.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/add-sikola-guide`
3. Add/update Markdown files in `data/`
4. Preview locally: `npm run dev`
5. Submit a PR with clear description and screenshots if UI changes

> 📌 **Style Guide**:  
> - Use `##` for section headers, `###` for subsections  
> - Code blocks must specify language: ` ```php `, ` ```bash `  
> - Internal links: `[Guide Title](/guides/project-name/file)`  
> - External links: `[Repo](https://github.com/mokesano/repo)`  

---

## 📜 License

This documentation hub is licensed under the **MIT License** — see [LICENSE](LICENSE) for details.

Individual project documentation may carry their own licenses; refer to each source repository.

---

> 🙏 **Maintained by** [Sangia Publishing House](https://sangia.org) for the **Lumera Frontedge Scholar** ecosystem.  
> 🌍 Supporting inclusive, multilingual documentation for Global South researchers and developers.

*Built with ❤️ and [Nextra](https://nextra.site) — because great docs shouldn't require a backend.* 🚀