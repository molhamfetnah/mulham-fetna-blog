#!/usr/bin/env bash
set -euo pipefail

main() {
    HUGO_VERSION="0.158.0"
    
    # NUCLEAR CLEANUP - Clear everything
    rm -f *.tar.gz hugo LICENSE README.md || true
    find . -name "hugo*" -delete || true
    rm -rf public/ resources/ bin/ || true

    echo "📦 Downloading Hugo..."
    curl -L --fail --no-cache-dir -o /tmp/hugo.tar.gz \
      "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
    
    tar -xzf /tmp/hugo.tar.gz -C /tmp
    mkdir -p bin/
    cp /tmp/hugo bin/
    rm -rf /tmp/hugo* *.tar.gz LICENSE README.md

    export PATH="$(pwd)/bin:$PATH"
    
    git submodule update --init --recursive || true
    
    echo "✅ $(hugo version)"
    hugo --gc --minify
    
    echo "✨ SUCCESS $(ls -la public/ | head -5)"
}

main "$@"