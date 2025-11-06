# bulliana.com

A minimal, fast, and typographically beautiful personal website inspired by [read.cv](https://read.cv) — clean, human, and content-first.

## Features

- ⚡ **Lightning fast** — 100% static HTML, zero JavaScript by default
- 🎨 **Beautiful typography** — Inter font with optional Newsreader serif accent
- 🌙 **Dark mode** — Automatic via `prefers-color-scheme`
- 📱 **Fully responsive** — Works beautifully on all devices
- ♿ **Accessible** — Semantic HTML with proper contrast ratios
- 🎯 **Content-first** — All content in a single JSON file

## Tech Stack

- [Astro](https://astro.build) — Static site generator
- [Tailwind CSS](https://tailwindcss.com) — Utility-first CSS
- [@tailwindcss/typography](https://tailwindcss.com/docs/plugins/typography) — Beautiful typographic defaults

## Getting Started

```bash
npm install
npm run dev      # Start dev server at http://localhost:4321
npm run build    # Build for production
npm run preview  # Preview production build
```

## For Contributors

When making styling changes, use this prompt with Cursor/AI to ensure consistency:

> When making styling changes, maintain the existing design system:
> - Use Tailwind CSS utility classes
> - Follow the zinc color palette with dark mode support
> - Maintain max-width of `max-w-2xl` (672px) for content
> - Use Inter font for body text, Newsreader for serif accents
> - Keep generous padding and margins for breathing room
> - Ensure all changes work in both light and dark modes via `prefers-color-scheme`
> - Preserve the minimal, content-first aesthetic

---

Built with [Astro](https://astro.build) and [Tailwind CSS](https://tailwindcss.com)
