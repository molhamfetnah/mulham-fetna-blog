# Project Knowledge Base

Last scanned (UTC): 2026-04-10T14:52:33Z

## 1) Project Identity

- **Type:** Hugo static site
- **Theme:** Blowfish (`theme = "blowfish"`)
- **Deployment target:** Cloudflare Pages (`https://mulham-fetna-blog.pages.dev/`)
- **Default language:** English (`defaultContentLanguage = "en"`)
- **Site focus:** Personal/professional brand, courses, workshops, roadmaps, guides, services

## 2) High-Level Architecture

- **Hugo core config:** `config/_default/hugo.toml`
- **Language/author metadata:** `config/_default/languages.en.toml`
- **Theme behavior/UI config:** `config/_default/params.toml`
- **Menus:** `config/_default/menus.en.toml`
- **Markup/rendering:** `config/_default/markup.toml`
- **Custom data source:** `data/organizations.yaml`
- **Custom shortcodes:** `layouts/shortcodes/`
  - `org-gallery.html`
  - `org-gallery-debug.html`
  - `cal-embed.html`
- **Custom assets:** `assets/css/custom.css`, `assets/org-images/*`, `assets/img/*`, `assets/logo/*`
- **Content:** `content/**` (section-driven structure with page bundles in many subfolders)
- **Theme source (vendored):** `themes/blowfish/` (large upstream theme codebase)

## 3) Current Content Topology

Top-level sections under `content/`:

- `About`
- `Courses`
- `Intellectual-Property`
- `Privacy`
- `Projects`
- `Roadmaps`
- `Services`
- `Social-Media-Posts`
- `Tutorials-Guides`
- `Workshops-Camps`

Notable implementation details:

- Several sections use page bundles (`section/topic/_index.md` + local cover/image files).
- `Courses/_index.md` uses shortcode `{{< org-gallery ... >}}`.
- Homepage (`content/_index.md`) has Cal embed shortcode currently commented out.
- Services pages use RTL shortcode blocks (`{{% rtl %}} ... {{% /rtl %}}`).

## 4) Navigation Model (Configured Menus)

Main menu:

1. Home
2. About
3. Projects
4. Courses
5. Roadmaps
6. Tutorials
7. Workshops
8. Posts
9. Hire Me

Footer menu:

1. Tags
2. Categories
3. IP Policy
4. Privacy

Source of truth: `config/_default/menus.en.toml`.

## 5) Custom Component: Organization Gallery

Key files:

- Data: `data/organizations.yaml`
- Assets: `assets/org-images/*`
- Renderer: `layouts/shortcodes/org-gallery.html`
- Documentation: `content/Tutorials-Guides/Hugo-BlowFish/Organization-Gallery-Component-Documentation.md`

Behavior:

- Reads organizations from YAML (governmental/non-governmental).
- Renders card grid with links, description, location.
- Uses Hugo image pipeline (`resources.Get`, `.Fit "400x300 webp q80"`).
- Emits JSON-LD structured data for SEO.

## 6) Build & Operational Notes

Local build command used in scan:

```bash
hugo --gc --minify
```

Observed scan result:

- Build succeeds.
- Hugo warning: **Module compatibility warning** for Blowfish version range.
- Hugo warning: **`.Site.Data` deprecated** (Hugo recommends `hugo.Data`).

Repository size indicators (snapshot):

- `content` files: 43
- `layouts` files: 3
- `config` files: 7
- `assets` files: 16
- `themes/blowfish` files: 2253

## 7) Known Quality/Consistency Findings

- `menus.en.toml` uses mixed case in `pageRef` values (works with current structure, but consistency could be improved).
- `content/Services/academic-mentroship/` appears to contain a typo in folder name (`mentroship` vs `mentorship`).
- `content/Projects/Smart-robot.md` is currently empty.
- `config/_default/module.toml` appears empty in current scan.
- `config/_default/icons.md` is a note file, not executable config.

## 8) Fast Orientation Guide for Future Edits

If you need to modify:

- **Branding / author bio / social links:** `config/_default/languages.en.toml`
- **Homepage behavior & theme toggles:** `config/_default/params.toml`
- **Header/footer menus:** `config/_default/menus.en.toml`
- **Organization gallery data/content:** `data/organizations.yaml` + `assets/org-images/*`
- **Custom styles:** `assets/css/custom.css`
- **Homepage copy:** `content/_index.md`
- **Service offer pages:** `content/Services/*`
- **Legal pages:** `content/Privacy/_index.md`, `content/Intellectual-Property/_index.md`

## 9) Suggested Next Hardening Targets

1. Replace deprecated `site.Data` usage with `hugo.Data` in custom shortcodes to remove deprecation warnings.
2. Normalize naming conventions (folder names, `pageRef` casing).
3. Fill/clean placeholder or empty content pages.
4. Keep all custom behavior documented in `Tutorials-Guides/Hugo-BlowFish/` for maintainability.
