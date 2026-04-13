-- Thought Box: Supabase Database Setup
-- Paste this entire block into Supabase SQL Editor and click Run

-- Table for storing reasoning chain analyses
CREATE TABLE IF NOT EXISTS analyses (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  label TEXT NOT NULL,
  chain_data JSONB NOT NULL,
  author TEXT DEFAULT 'anonymous',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE analyses ENABLE ROW LEVEL SECURITY;

-- Allow all operations with anon key (suitable for small research teams)
-- For larger teams, you may want to add authentication
CREATE POLICY "Allow read" ON analyses FOR SELECT USING (true);
CREATE POLICY "Allow insert" ON analyses FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow delete" ON analyses FOR DELETE USING (true);

-- Optional: Index for faster loading
CREATE INDEX IF NOT EXISTS idx_analyses_created ON analyses (created_at DESC);
