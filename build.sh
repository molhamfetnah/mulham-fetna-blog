#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Using Cloudflare's built-in Hugo..."
git submodule update --init --recursive
hugo --gc --minify
echo "✨ Built $(find public -name '*.html' | wc -l) pages"
ls -la public/