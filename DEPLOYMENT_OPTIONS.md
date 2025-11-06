# Deployment Options for Personal Sites

## Free Tier Comparison

### ✅ Netlify (Recommended for Astro)
**Free Tier:**
- ✅ 100 GB bandwidth/month
- ✅ 300 build minutes/month
- ✅ Unlimited sites
- ✅ Custom domains (free SSL)
- ✅ Form handling (100 submissions/month)
- ✅ Deploy previews
- ✅ Excellent Astro support

**Setup:**
1. Push code to GitHub
2. Connect repository to Netlify
3. Build settings:
   - Build command: `npm run build`
   - Publish directory: `dist`
4. Deploy! (usually takes < 1 minute)

**Pros:**
- Zero configuration needed for Astro
- Fast deployments
- Great developer experience
- No issues with `_astro` directory

**Cons:**
- 100 GB bandwidth limit (usually fine for personal sites)

---

### ✅ Vercel
**Free Tier:**
- ✅ 100 GB bandwidth/month
- ✅ Unlimited builds
- ✅ Custom domains (free SSL)
- ✅ Edge functions
- ✅ Excellent Astro support

**Setup:**
1. Push code to GitHub
2. Connect repository to Vercel
3. Auto-detects Astro (zero config needed)
4. Deploy!

**Pros:**
- Fastest deployments
- Excellent performance
- Great for Next.js, Astro, etc.
- No issues with `_astro` directory

**Cons:**
- Slightly less generous than Netlify for some features

---

### ⚠️ GitHub Pages (Current)
**Free Tier:**
- ✅ Unlimited bandwidth
- ✅ Custom domains
- ✅ Free SSL

**Issues:**
- ❌ Jekyll processing causes problems with `_astro` directory
- ❌ Requires `.nojekyll` workarounds
- ❌ Can be slow to update
- ❌ Limited build time

**When to use:**
- Simple static sites without frameworks
- When you need unlimited bandwidth
- When you want everything in one place (GitHub)

---

### ✅ Cloudflare Pages
**Free Tier:**
- ✅ Unlimited bandwidth
- ✅ Unlimited builds
- ✅ Custom domains (free SSL)
- ✅ Fast global CDN

**Setup:**
1. Connect GitHub repository
2. Build settings:
   - Build command: `npm run build`
   - Build output directory: `dist`
3. Deploy!

**Pros:**
- Unlimited bandwidth (best for high traffic)
- Very fast CDN
- Good Astro support

**Cons:**
- Slightly less polished UI than Netlify/Vercel

---

## Recommendation for Your Site

**Best Choice: Netlify or Vercel**

Both are excellent for Astro and will solve your GitHub Pages issues immediately. They:
- ✅ Handle `_astro` directory correctly (no Jekyll issues)
- ✅ Deploy in under 1 minute
- ✅ Provide free SSL certificates
- ✅ Support custom domains
- ✅ Have generous free tiers for personal sites

**Quick Migration Steps:**

1. **Netlify:**
   - Go to https://netlify.com
   - Sign up with GitHub
   - Click "Add new site" → "Import an existing project"
   - Select your repository
   - Build command: `npm run build`
   - Publish directory: `dist`
   - Click "Deploy site"
   - Done! (takes ~30 seconds)

2. **Vercel:**
   - Go to https://vercel.com
   - Sign up with GitHub
   - Click "Add New Project"
   - Select your repository
   - Vercel auto-detects Astro
   - Click "Deploy"
   - Done! (takes ~30 seconds)

3. **Update Custom Domain (if using bulliana.com):**
   - In Netlify/Vercel dashboard, go to Domain settings
   - Add your custom domain
   - Update DNS records as instructed
   - SSL certificate is automatically provisioned

---

## About the Vite Warning

The warning you're seeing:
```
[WARN] [vite] "isRemoteAllowed", "matchHostname", "matchPathname", "matchPort" and "matchProtocol" are imported from external module "@astrojs/internal-helpers/remote" but never used
```

This is **harmless** - it's just an unused import warning from Vite. It doesn't affect functionality and can be safely ignored. It's a known issue in some Astro versions and will likely be fixed in future updates.

---

## Next Steps

1. **Try fixing GitHub Pages first** (the workflow update should help)
2. **If it still doesn't work**, migrate to Netlify or Vercel (5 minutes, zero hassle)
3. **Enjoy fast, reliable deployments!** 🚀

