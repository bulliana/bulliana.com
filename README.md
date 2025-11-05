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

### Prerequisites

- Node.js 18.20.8+ (or 20.3.0+, or 22+)
- npm 9.6.5+ (or pnpm 7.1.0+)

### Installation

```bash
npm install
```

### Development

Start the development server:

```bash
npm run dev
```

Visit `http://localhost:4321` to see your site.

### Building

Build the site for production:

```bash
npm run build
```

The static site will be output to the `dist/` directory.

### Preview

Preview the production build locally:

```bash
npm run preview
```

## Customization

### Editing Content

All content is stored in `/src/content/site.json`. Edit this file to update:

- Your name and tagline
- Location
- About section
- Social links (email, GitHub, Twitter, LinkedIn)
- Highlights/projects
- "Now" section

### Adding an Avatar

1. Add your avatar image to `/public/avatar.jpg`
2. Uncomment the avatar `<img>` tag in `/src/pages/index.astro`

### Styling

The design uses Tailwind CSS with custom typography settings. Main design tokens:

- **Fonts**: Inter (sans-serif), Newsreader (serif accent)
- **Colors**: Zinc palette with dark mode support
- **Max width**: `max-w-2xl` (672px)
- **Spacing**: Generous padding and margins for breathing room

Edit `/tailwind.config.cjs` to customize fonts, colors, or spacing.

### Dark Mode

Dark mode is automatically enabled based on the user's system preference via `prefers-color-scheme`. No toggle needed — it just works.

## Deployment

### GitHub Pages

1. **Build the site:**
   ```bash
   npm run build
   ```

2. **Set up GitHub Actions** (recommended):
   - Create `.github/workflows/deploy.yml`:
   ```yaml
   name: Deploy to GitHub Pages

   on:
     push:
       branches: [ main ]
     workflow_dispatch:

   permissions:
     contents: read
     pages: write
     id-token: write

   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4
         - uses: actions/setup-node@v4
           with:
             node-version: '20'
         - run: npm install
         - run: npm run build
         - uses: actions/upload-pages-artifact@v3
           with:
             path: ./dist

     deploy:
       needs: build
       runs-on: ubuntu-latest
       environment:
         name: github-pages
         url: ${{ steps.deployment.outputs.page_url }}
       steps:
         - uses: actions/deploy-pages@v4
   ```

3. **Enable GitHub Pages** in your repository settings:
   - Go to Settings → Pages
   - Source: GitHub Actions

4. **Update `astro.config.mjs`** if deploying to a subpath:
   ```js
   export default defineConfig({
     base: '/your-repo-name/', // if deploying to username.github.io/repo-name
     // ... rest of config
   });
   ```

### Netlify

1. Push your code to GitHub
2. Connect your repository to [Netlify](https://netlify.com)
3. Build settings:
   - Build command: `npm run build`
   - Publish directory: `dist`

### Vercel

1. Push your code to GitHub
2. Connect your repository to [Vercel](https://vercel.com)
3. Vercel will auto-detect Astro and configure everything

## Project Structure

```
/
├── public/
│   ├── avatar.jpg          # Optional avatar image
│   └── favicon.svg         # Site favicon
├── src/
│   ├── components/
│   │   ├── Highlight.astro # Project highlight component
│   │   └── LinkList.astro  # Social links component
│   ├── content/
│   │   └── site.json       # All site content
│   ├── layouts/
│   │   └── BaseLayout.astro # Main layout
│   ├── pages/
│   │   ├── index.astro     # Homepage
│   │   └── now.mdx         # Now page
│   └── styles/
│       └── global.css      # Global styles
├── astro.config.mjs        # Astro configuration
├── tailwind.config.cjs     # Tailwind configuration
└── package.json
```

## Performance

This site is designed to be extremely fast:

- Zero JavaScript shipped (unless you add interactivity)
- Static HTML generation
- Minimal CSS (Tailwind with purging)
- Optimized fonts (Google Fonts with `preconnect`)

Target: **Mobile Lighthouse score ≥ 95**

## License

MIT

---

Built with [Astro](https://astro.build) and [Tailwind CSS](https://tailwindcss.com)
