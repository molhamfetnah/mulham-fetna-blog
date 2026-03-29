#!/usr/bin/env bash

# Build script for Hugo on Cloudflare Workers/Pages
set -euo pipefail

main() {
    HUGO_VERSION="0.158.0"
    export TZ=UTC

    echo "🚀 Starting Hugo build process..."

    # Cleanup previous failed downloads
    rm -f hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz hugo LICENSE README.md

    # Install Hugo
    echo "📦 Installing Hugo v${HUGO_VERSION}..."
    curl -LJO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
    tar -xf "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
    mkdir -p /opt/buildhome/
    cp hugo /opt/buildhome/
    rm -f LICENSE README.md "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" hugo

    # Set PATH
    export PATH="/opt/buildhome:$PATH"

    # Themes
    echo "🎨 Setting up themes..."
    git submodule update --init --recursive
    git config core.quotepath false

    # Verify
    echo "✅ Hugo: $(hugo version)"

    # Build
    echo "🔨 Building site..."
    hugo --gc --minify

    echo "✨ Build complete! Public dir ready."
}

main "$@"