# 🧠 Thought Box v4

**Universal Reasoning Chain Extractor with Team Cloud Storage**

Extract, classify, and compare reasoning chains. Find root divergences. Share analyses with your team via cloud database.

---

## Quick Start

1. Download `index.html`, open in browser
2. Enter your [Anthropic API key](https://console.anthropic.com/settings/keys)
3. **Optional**: Connect Supabase for team cloud storage (see below)
4. Start analyzing documents

---

## ☁️ Supabase Setup (3 minutes — FREE)

This lets your whole team share saved analyses. Everyone sees the same data.

### Step 1: Create a Supabase account
Go to [supabase.com](https://supabase.com) → Sign up free → Create a new project.
Choose any name (e.g., "thought-box") and set a database password.

### Step 2: Create the database table
In your Supabase dashboard, go to **SQL Editor** (left sidebar) and paste this:

```sql
CREATE TABLE analyses (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  label TEXT NOT NULL,
  chain_data JSONB NOT NULL,
  author TEXT DEFAULT 'anonymous',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Allow anyone with the anon key to read, insert, delete
ALTER TABLE analyses ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all operations" ON analyses
  FOR ALL
  USING (true)
  WITH CHECK (true);
```

Click **Run**. You should see "Success".

### Step 3: Get your credentials
Go to **Settings → API** (left sidebar). You need two things:
- **Project URL**: looks like `https://xxxxxxxxxxxx.supabase.co`
- **anon public key**: starts with `eyJ...`

### Step 4: Connect in Thought Box
When you open Thought Box, it will ask for these two values. Paste them in.
That's it — you're connected. Everyone who enters the same credentials shares the same database.

### Sharing with your team
Give your friends:
1. The website URL (your GitHub Pages link)
2. The Supabase URL and anon key (they enter it once, it's saved in their browser)
3. They'll need their own Anthropic API key

---

## Features

- **Two-pass extraction**: Extract → Self-validate
- **6 premise types**: Factual, Forecast, Causal, Moral (Outcome), Moral (Action), Definitional
- **Moral sentiment**: 5-level scale on all moral premises
- **Multiple conclusions** per document
- **Pairwise divergence analysis**: Find root divergences between stakeholders
- **Cloud sync**: Team storage via Supabase (or local-only mode)
- **Author attribution**: See who analyzed which document
- **Export JSON**: Download any analysis or divergence result

---

## Deploy on GitHub Pages

1. Create repo at [github.com/new](https://github.com/new) — name it `thought-box`
2. Upload: `index.html`, `README.md`, `LICENSE`
3. Settings → Pages → Source: main branch → Save
4. Share: `https://yourusername.github.io/thought-box/`

---

## Based On

- Truong, Puranam & Koçak (2025) — PEEL framework
- Koçak & Puranam (2022) — Culture as codes
- Walton (1996) — Argumentation schemes

## License
MIT
**
##Examples of Reasoning Chains:**

P1 (factual): Phosphorus levels exceed safe thresholds
P2 (causal): Agricultural runoff causes phosphorus loading
P3 (forecast): Blooms will worsen by 30% in 10 years
P4 (moral_outcome): Worsening blooms threatening public health is bad
P5 (factual): Voluntary practices have failed

R1: P1 + P2 => P3        (high phosphorus + runoff causes it → blooms will worsen)
R2: P3 ^ P4              (worsening blooms evaluated as bad)
R3: R2 + P5 => C1        (it's bad + voluntary failed → regulate)

C1: Government should implement stricter fertilizer limits
