#!/usr/bin/env bash

# Build script for Hugo on Cloudflare Workers
set -euo pipefail

main() {
    HUGO_VERSION="0.158.0"
    export TZ=UTC+3

    echo "🚀 Starting Hugo build process..."

    # Install Hugo
    echo "📦 Installing Hugo v${HUGO_VERSION}..."
    curl -LJO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
    tar -xf "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
    cp hugo /opt/buildhome/
    rm LICENSE README.md "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"

    # Set PATH
    echo "🔧 Configuring environment..."
    export PATH="/opt/buildhome:$PATH"

    # Initialize submodules (for themes)
    echo "🎨 Setting up themes..."
    git submodule update --init --recursive
    git config core.quotepath false

    # Verify installations
    echo "✅ Verifying installations..."
    echo "Hugo: $(hugo version)"
    echo "Node.js: $(node --version || echo 'Not available')"
    echo "Go: $(go version || echo 'Not available')"

    echo "Clone Blowfish theme ..."
    git submodule update --init --recursive
    git config core.quotepath false


    # Build the site
    echo "🔨 Building Hugo site..."
    hugo --gc --minify

    echo "✨ Build completed successfully!"
}

main "$@"
