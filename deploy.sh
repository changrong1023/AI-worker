#!/usr/bin/env bash
# Simple deployment script using wrangler CLI
set -e

if ! command -v wrangler >/dev/null 2>&1; then
  echo "wrangler CLI is required. Install it with 'npm install -g wrangler'" >&2
  exit 1
fi

if [ -z "$GEMINI_API_KEY" ]; then
  echo "Please export GEMINI_API_KEY with your Google Gemini API key." >&2
  exit 1
fi

echo "$GEMINI_API_KEY" | wrangler secret put GEMINI_API_KEY --non-interactive

wrangler deploy
