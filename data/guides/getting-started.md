---
title: Getting Started
description: Quick start guide for using Lumera documentation
order: 1
---

# Getting Started with Lumera Documentation

Welcome! This guide will help you navigate and use the Lumera documentation hub.

## Overview

The Lumera Documentation Hub is built with [Chappe](https://github.com/crisp-oss/chappe), a modern static documentation builder that produces lightweight, runtime-free assets.

### Features

- **Static & Fast**: Optimized static assets — no runtime dependencies
- **Markdown-First**: Write guides in standard Markdown
- **API Blueprint Support**: Document REST APIs using API Blueprint syntax
- **Built-in Search**: Local search index generated at build time
- **Dark Mode + Responsive**: Works seamlessly across all devices
- **SEO Ready**: Auto-generated sitemaps and Open Graph tags

## Navigation

### Guides Section
Located in `/guides/`, this section contains:
- User tutorials
- Conceptual guides
- Step-by-step workflows

### References Section
Located in `/references/`, this section contains:
- API specifications
- Technical references
- Configuration details

### Changelogs
Located in `/changes/`, this section tracks:
- Version history
- New features
- Bug fixes
- Breaking changes

## Writing Documentation

### Basic Structure

```markdown
---
title: Your Page Title
description: A brief description of this page
order: 1
---

# Main Heading

## Section Heading

Your content here...
```

### Code Blocks

Specify the language for syntax highlighting:

````markdown
```php
<?php
echo "Hello, World!";
```
````

### Callouts

Use blockquotes for tips and notes:

```markdown
> 💡 **Tip**: This is a helpful tip for users.

> ⚠️ **Warning**: Important warning information.
```

## Next Steps

- Explore the [Guides](/guides/) section
- Check out the [API References](/references/)
- Review the latest [Changelogs](/changes/)

---

Need help? See our [Contributing Guide](/contributing) for more information.
