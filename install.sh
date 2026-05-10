#!/bin/bash
# NAS Agent - One-line installer wrapper
# Usage: curl -fsSL https://nas-agent.github.io/Landing-page/install.sh | sudo bash

set -euo pipefail

RELEASE_URL="https://github.com/nas-agent/Landing-page/releases/download/v0.0.1/nas-agent-installer.tar.gz"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading NAS Agent installer..."
curl -fsSL "$RELEASE_URL" -o "$TMP_DIR/nas-agent-installer.tar.gz"

echo "Extracting..."
tar -xzf "$TMP_DIR/nas-agent-installer.tar.gz" -C "$TMP_DIR"

exec bash "$TMP_DIR/nas-agent-final/install.sh" "$@"
