# How to Verify GitHub Pages Deployment

## Problem: CSS files returning 404 on GitHub Pages

If styles work locally but not on GitHub Pages, follow these steps to diagnose the issue.

## Method 1: Check the Deployed Site Directly

### 1. Verify `.nojekyll` file is accessible:
Visit: `https://bulliana.github.io/.nojekyll`
- **Expected**: Should return an empty file or show file contents
- **If 404**: The file isn't being deployed correctly

### 2. Check if `_astro` directory is accessible:
Visit: `https://bulliana.github.io/_astro/`
- **Expected**: Should list directory contents or return a directory listing
- **If 404**: Jekyll is still processing and ignoring the `_astro` directory

### 3. Try accessing the CSS file directly:
1. Open your deployed site: `https://bulliana.github.io/`
2. Open browser DevTools (F12)
3. Go to Network tab
4. Reload the page
5. Find the CSS file request (should be something like `_astro/index.XXXXX.css`)
6. Click on it to see the full URL
7. Try accessing that URL directly in a new tab

### 4. Check the HTML source:
1. Visit: `https://bulliana.github.io/`
2. Right-click → View Page Source
3. Search for `_astro` to see how CSS is referenced
4. Check if paths are absolute (`/_astro/...`) or relative (`./_astro/...`)

## Method 2: Download and Inspect the GitHub Pages Artifact

### Option A: Using GitHub Actions UI
1. Go to your repository on GitHub
2. Click on "Actions" tab
3. Find the latest successful workflow run
4. Click on the "build" job
5. Scroll down to "Artifacts" section
6. Download the artifact
7. Extract and inspect the `dist` folder

### Option B: Using GitHub CLI (if installed)
```bash
gh run list --workflow=deploy.yml
gh run download <run-id> -n pages-artifact
# Then inspect the downloaded files
```

### Option C: Clone the gh-pages branch (if it exists)
```bash
git clone --branch gh-pages https://github.com/bulliana/bulliana.com.git gh-pages-check
cd gh-pages-check
ls -la
# Check if .nojekyll exists
# Check if _astro directory exists
```

## Method 3: Check GitHub Pages Settings

1. Go to repository Settings → Pages
2. Verify:
   - **Source**: Should be "GitHub Actions" (NOT "Deploy from a branch")
   - **Custom domain**: If you have one configured, check DNS settings
   - **Enforce HTTPS**: Should be enabled

## Method 4: Check Build Logs

In the GitHub Actions workflow logs, look for:
- ✅ `.nojekyll` file verification
- ✅ `_astro` directory verification  
- ✅ CSS files count
- ✅ HTML file references to CSS

The workflow now creates a `BUILD_INFO.txt` file in the dist folder that you can access at:
`https://bulliana.github.io/BUILD_INFO.txt`

## Common Issues and Solutions

### Issue 1: `.nojekyll` not working
**Symptoms**: `_astro` directory returns 404
**Solution**: 
- Ensure GitHub Pages source is set to "GitHub Actions" (not branch)
- Wait 5-10 minutes after deployment
- Try redeploying

### Issue 2: Wrong base path
**Symptoms**: CSS paths are incorrect in HTML
**Solution**: 
- If site is at `username.github.io/repo-name/`, set `base: '/repo-name/'` in `astro.config.mjs`
- If site is at `username.github.io/` (root), keep `base: '/'`

### Issue 3: Custom domain issues
**Symptoms**: Works on `.github.io` but not custom domain
**Solution**:
- Check DNS settings
- Verify custom domain in GitHub Pages settings
- Clear CDN cache if using Cloudflare or similar

### Issue 4: GitHub Pages still using Jekyll
**Symptoms**: `.nojekyll` exists but `_astro` still 404
**Solution**:
- Disable Jekyll in repository settings (if option exists)
- Ensure `.nojekyll` is truly empty (0 bytes)
- Try adding `_config.yml` with `theme: null` (alternative method)

## Alternative: Use a Different Deployment Method

If GitHub Pages continues to have issues, consider:
- **Netlify**: Often handles Astro better
- **Vercel**: Excellent Astro support
- **Cloudflare Pages**: Fast and free

## Debugging Commands

Run these locally after `npm run build` to verify build output:

```bash
# Check if .nojekyll exists
ls -la dist/.nojekyll

# Check _astro directory
ls -la dist/_astro/

# Check CSS files
find dist/_astro -name "*.css"

# Check HTML references
grep -r "_astro" dist/*.html

# Verify file structure
tree dist -L 2
```

