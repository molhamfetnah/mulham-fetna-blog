#!/usr/bin/env bash
set -euo pipefail

main() {
    HUGO_VERSION="0.158.0"
    export TZ=UTC

    echo "🚀 Starting Hugo build..."

    # AGGRESSIVE CLEANUP - Remove ALL possible stale files FIRST
    rm -f hugo* LICENSE README.md *.tar.gz || true
    rm -rf public/ resources/ || true

    echo "📦 Downloading Hugo v${HUGO_VERSION}..."
    curl -L --fail -o hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
    
    echo "📦 Extracting..."
    tar -xzf hugo.tar.gz
    mkdir -p bin/
    mv hugo bin/
    rm -f hugo.tar.gz LICENSE README.md

    export PATH="$(pwd)/bin:$PATH"
    
    echo "🎨 Themes..."
    git submodule update --init --recursive || true

    echo "✅ $(hugo version)"
    echo "🔨 Building..."
    hugo --gc --minify

    echo "✨ DONE - public/ ready!"
    ls -la public/
}

main "$@"