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