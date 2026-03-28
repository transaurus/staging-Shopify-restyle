#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for Shopify/restyle
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.
# Expected to be run from the documentation/ directory of the checked-out repo.

# --- Node version ---
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -f "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
    nvm install 20
    nvm use 20
fi

# --- Package manager + dependencies ---
yarn install --frozen-lockfile

# --- Build ---
yarn build

echo "[DONE] Build complete."
