# Final Project Submission

**Repository:** https://github.com/nickmorata07/fullstack-final-project
**Live site:** https://nickmorata07.github.io/fullstack-final-project/
**API:** https://your-api.onrender.com/healthz

# Weekly Increment Report — Week 1

**Week of:** September 24, 2026

## What changed this week
- Configured repository visibility to public and set up GitHub Actions Pages deployment pipeline.
- Updated project branding across `client/index.html` and root `README.md` to reflect **GradePulse — Grade Tracker & Final Grade Forecaster**.
- Updated open-source license with copyright details.
- Verified local development build and browser demo mode rendering using Vite.
- Established private workspace submission links in `project/README.md`.

## Why
These changes establish the core repository foundation, public hosting capabilities, and baseline environment setup required before replacing the template interface with GradePulse components.

## What broke or what I got stuck on
- Encountered path directory navigation errors (`cd client`) when running terminal commands from inside the `server` working directory. Resolved by navigating up to the root folder using `cd ..`.

## What is left
- Replace mock data schema (`src/api/mockApi.js` and `seed.json`) with GradePulse models (`courses`, `weights`, `scores`).
- Build core React page components (`/courses`, `/courses/:id`, `/courses/:id/forecaster`).
- Set up Express server routes and PostgreSQL database connection.

# Weekly Increment Report — Week 2

**Week of:** September 27, 2026

## What changed this week

- Created `server/schema.sql` defining PostgreSQL database tables for `courses`, `category_weights`, and `assessment_scores`, complete with relational foreign key cascades and sample seed data.
- Built `server/db.js` using `pg.Pool` to manage PostgreSQL connection pooling securely via environment variables (`dotenv`).
- Implemented `server/index.js` with Express API routes: `/api/health`, `GET /api/courses` (list courses), `POST /api/courses` (create course), and `GET /api/courses/:id` (fetch course details with category breakdown).
- Configured parameterized SQL queries (`$1`, `$2`) on all endpoints to guard against SQL injection vulnerabilities.
- Updated `server/.env.example` with local database connection string defaults (`gradepulse_db`).

## Why

These changes establish the backend infrastructure required to transition GradePulse from a static UI prototype into a functional full-stack application capable of managing course weights and calculating assessment targets.

## What broke or what I got stuck on

- **File Extension Syntax Errors:** Encountered red syntax errors when creating `schema.sql` because the file was initially saved as `schema.js`. Resolved by renaming the file extension to `.sql` so VS Code parses SQL code syntax properly.
- **Environment Path Contexts:** Navigating between root and nested server environment files required isolating backend runtime parameters inside `server/.env.example` to prevent committing live database secrets to GitHub.

## What is left

- Connect React client (`client/src`) components using `fetch()` calls to display dynamic backend API data on the dashboard.
- Build remaining endpoints for updating assessment scores (`POST /api/scores`) and calculating required target grades (`POST /api/forecast`).
- Complete `SECURITY-CHECKLIST.md` for Week 2 documentation and prepare final presentation materials for Week 3.