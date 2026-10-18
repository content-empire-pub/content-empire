# Content Empire — Project Status
Last updated: 2026-10-18

## Ralph Watch — 2026-10-18

- Both remote main branches and the clean checkout were synchronized at
  `d240376` before this update. No open PRs; 25 open primary issues and
  1 organization issue. Recent CI runs are green; no failed run needs a rerun.
- Current API access is **read-only on both repositories**. Loading organization
  brand variables returns HTTP 403. The October 14 admin/push access finding
  is historical, not current. Configuration cannot currently be verified or
  repaired through the available repository token.
- October 16 newsletter runs still did not publish: organization run
  `38941876609` exported HTML because both Substack settings are missing;
  primary run `38942022228` received HTTP 403. Organization artifact
  `12063167729` expires October 30.
- Medium's latest scheduled organization run remains October 12,
  `38298931504`: 0 posted, 10 drafts exported. Artifact `11770151503` expires
  October 26. Automatic publishing remains blocked by primary issue #46.
- Downloaded and verified all 10 Medium HTML drafts and the October 16 newsletter
  HTML in this watch session's persistent `files/` directory, under
  `medium-2026-10-12/` and `newsletter-2026-10-16/`. These local copies survive
  Actions artifact expiration; they are not published content.
- October 14 organization Netlify run `38523219469` again reported success
  while logging `Netlify credentials not provided, not deployable`. Primary
  Netlify remains manually disabled. Medium and newsletter workflows remain
  active on both repositories; do not re-enable or rerun them unnecessarily.
- Live homepage, `/posts/`, and `/pages/about/` all return HTTP 200.
  Existing follow-up remains organization issue
  `content-empire-pub/content-empire#1` and primary issues #30 and #46.
- Remote updates are blocked: pushes to both repositories return HTTP 403,
  and posting the watch report to organization issue #1 is denied by the
  Enterprise Managed User policy. This status update is retained locally.

עברית: אין בקשות משיכה פתוחות, שני המאגרים מסונכרנים והריצות האחרונות ירוקות.
עם זאת, לא פורסם תוכן: Medium ייצא עשר טיוטות, והניוזלטר חסום בהגדרות חסרות
או בשגיאת 403. הטיוטות הורדו ונשמרו בתיקיית העבודה של הסשן לפני תפוגתן.
Netlify לא פרס למרות דיווח הצלחה. האתר זמין; ההרשאות הנוכחיות בשני המאגרים
הן לקריאה בלבד, והגישה למשתני המותג חסומה.

## Ralph Watch — 2026-10-14

- Both repository copies are synchronized at `1d75996` before this status update.
  There are no open pull requests; the primary repository has 25 open issues and
  the organization repository has 1.
- Recent scheduled Medium and newsletter runs are green on both repositories,
  but **green CI is not evidence of publication**.
- Medium: October 12 runs exported 10 HTML drafts and posted 0 articles.
  Organization run `38298931504` retains artifact `11770151503` until October 26.
  Automatic Medium publishing remains blocked; see primary issue #46.
- Newsletter: the October 9 organization run `37978094544` exported HTML because
  both Substack settings are missing. Artifact `11638879326` expires October 23.
  The primary repository has the settings, but run `37978235766` received HTTP 403
  (bot protection or expired session) and also retained a manual-publishing draft.
- Netlify: organization run `37571023477` reported success while logging
  `Netlify credentials not provided, not deployable`. Neither Netlify secret is
  configured on the organization repository. The primary Netlify workflow is
  manually disabled. Do not treat either as an independent hosting deployment.
- Brand configuration is readable again. The organization token has admin access;
  the primary token has push/triage access but not admin. Earlier permission
  blockers are not evidence of the current access state. Publishing credentials
  must still be provisioned or refreshed; they cannot be recovered from secret
  names alone.
- Live checks: the organization homepage, article listing, and About page return
  HTTP 200. All five product links listed below also return HTTP 200; this checks
  reachability, not checkout, ownership, or revenue. The two-store consolidation
  decision remains unresolved.
- Tracked follow-up: organization issue
  `content-empire-pub/content-empire#1` and primary issues #30 and #46.

עברית: אין בקשות משיכה פתוחות, והריצות האחרונות ירוקות, אך הן אינן מעידות על
פרסום. Medium יצר עשר טיוטות ללא פרסום; הניוזלטר נשמר כטיוטה בגלל הגדרות חסרות
בארגון וחסימת 403 במאגר הראשי. Netlify דיווח על הצלחה ללא פריסה בגלל פרטי גישה
חסרים. האתר וקישורי המוצרים זמינים; נדרשים פרסום ידני או תיקון הגדרות הגישה.

## Brand Identity
- **Name:** Content Empire
- **NEVER mention "real owner identity"** — independent brand
- **Hugo static site** deployed to GitHub Pages (docs/ folder)
- **Base URL:** https://content-empire-pub.github.io/content-empire/ (needs independent domain)
- **Funding:** GitHub Sponsors configured (FUNDING.yml)

## Content Produced

### Articles — Medium-Ready (10)
Located in `medium-ready/`:
- 01-building-ai-agent-teams.md
- 02-mcp-servers-plugin-system.md
- 03-playwright-beyond-testing.md
- 04-content-empire-zero-employees.md
- 05-hidden-cost-of-not-automating.md
- developer-guide-technical-writing.md
- docker-compose-all-you-need.md
- github-actions-guide-2026.md
- rust-vs-go-2026.md
- saas-mvp-weekend-ai.md

### Articles — Dev.to-Ready (6 unique articles, 9 files)
Located in `devto-ready/`:
- 01-ai-agent-teams.md
- 02-mcp-servers.md
- 03-hidden-cost-not-automating.md
- 04-5-prompt-patterns-every-developer-needs.md
- 05-why-ai-agents-replace-scripts.md
- 06-mcp-servers-the-missing-manual.md

The first three also have `-devto.md` variants; do not publish both variants as
separate articles.

### Articles — Site Posts (11)
Located in `site/content/posts/`:
- build-content-empire.md
- building-ai-agent-teams.md
- content-empire-zero-employees.md
- durable-task-aspire.md
- hidden-cost-of-not-automating.md
- indie-game-dev-2026.md
- kubernetes-for-side-projects.md
- mcp-servers-plugin-system.md
- non-human-accounts.md
- playwright-beyond-testing.md
- _index.md (listing page)

**Total unique articles: ~10** (some cross-posted across platforms)

### Course Product
- **"AI-Powered Development: From Copilot to Full Agent Teams"** — 7 modules
  - Defined in `course-product.md`
  - Early Bird: $9.99 | Full Price: $19.99 | Team: $14.99/seat
  - Modules: AI Landscape, Prompt Engineering, Code Review, AI Agents, Multi-Agent, Production, Future

### Hugo Static Site
- **Generator:** Hugo (`site/hugo.toml`)
- **Built output:** `docs/` directory (~106 files)
- **Menu:** Articles, Courses, About
- **Output formats:** HTML + RSS

## Supporting Materials

### Brand & Marketing
- `brand/brand-guide.md` — Brand guidelines
- `brand/cross-posting-workflow.md` — Cross-platform publishing workflow
- `social/profiles.md` — Social media profile configs
- `content-calendar/calendar-2025.md` — Content calendar

### Publishing
- `PUBLISHING_CHECKLIST.md` — Detailed guide for Medium (5 articles) + Dev.to (3 articles)
  - Includes publishing schedule, SEO tips, social sharing steps
  - Medium: Days 1, 3, 5, 8, 10
  - Dev.to: Days 2, 4, 9 (staggered)

### Monetization
- `monetization/gumroad-product-listing.md` — Gumroad product creation guide
- `config/affiliates.json` — Affiliate program configs
- `ads-setup.md` — AdSense setup instructions
- `REVENUE_STRATEGY.md` — Revenue strategy document

## GitHub Actions Workflows
- `deploy.yml` — Site deployment workflow (publishes `docs/` + root `index.html` landing page to GitHub Pages)
- `post-medium.yml`, `substack-newsletter.yml`, `upload-youtube.yml`, `deploy-netlify.yml`

## Live URLs (verified 2026-10-14)
- Site: https://content-empire-pub.github.io/content-empire/ — 200
- Gumroad store: https://squadai.gumroad.com — 200
  - `/l/squad-mastery` ($14.99), `/l/ai-powered-dev` ($9.99), `/l/prompt-cheatsheet` ($4.99) — all 200
- ⚠️ `https://content-empire.netlify.app/` is dead (404). All references replaced with the GitHub Pages URL.
- ⚠️ Two Gumroad stores exist: `squadai.gumroad.com` (used by all repo content) and
  `tdsquad.gumroad.com` (referenced by the `GUMROAD_STORE_URL` repo variable). The
  `GUMROAD_AI_COURSE_ID=jnmqpd` / K8s `nnefv` product IDs only resolve on `tdsquad`.
  These need to be consolidated onto one store.

## GitHub Issues
- Tracked in `GITHUB_ISSUES.md` (4 key issues):
  1. Launch Course on Gumroad (Early Bird $9.99/$19.99)
  2. Set Up GitHub Sponsors (3 tiers: $5, $15, $50/month)
  3. Launch Newsletter (target: 500+ subscribers in 3 months)
  4. Create First Digital Product (Prompt Engineering Cheat Sheet $4.99)

## Pending Actions
- [ ] Consolidate Gumroad stores (squadai vs tdsquad) and update `GUMROAD_STORE_URL` variable
- [ ] Publish 5 articles to Medium (follow PUBLISHING_CHECKLIST.md schedule)
- [ ] Publish 3 articles to Dev.to
- [ ] Create Gumroad listing for AI-Powered Dev course
- [ ] Deploy to independent hosting (Netlify/Vercel)
- [ ] Set up Substack newsletter
- [ ] Register real AdSense publisher ID
- [ ] Create social media accounts (Dev.to, Medium, Hashnode, X)
- [ ] Create Prompt Engineering Cheat Sheet product ($4.99)
- [ ] Set up Medium cross-posting API automation
