#!/usr/bin/env bash
# Install Archelon Dev Hub globally — rules + skills apply to EVERY project.
#
# Usage:
#   ./setup/install-global.sh              # install from this repo (symlink)
#   ./setup/install-global.sh --clone      # clone from GitHub into plugin dir
#   ./setup/install-global.sh --update     # git pull if cloned

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN_NAME="archelon-dev-hub"
PLUGIN_DIR="${HOME}/.cursor/plugins/local/${PLUGIN_NAME}"
SKILLS_DIR="${HOME}/.cursor/skills"
GITHUB_URL="https://github.com/Archelon-Solutions/Cursor.git"
BRANCH="main"

MODE="symlink"
if [[ "${1:-}" == "--clone" ]]; then
  MODE="clone"
elif [[ "${1:-}" == "--update" ]]; then
  MODE="update"
fi

echo "=== Archelon Dev Hub — Global Install ==="
echo ""

# --- Install plugin ---
mkdir -p "${HOME}/.cursor/plugins/local"

if [[ "$MODE" == "clone" ]]; then
  if [[ -d "$PLUGIN_DIR/.git" ]]; then
    echo "Plugin already cloned at $PLUGIN_DIR — run with --update to pull latest."
  else
    echo "Cloning from GitHub into $PLUGIN_DIR ..."
    git clone --branch "$BRANCH" "$GITHUB_URL" "$PLUGIN_DIR"
  fi
elif [[ "$MODE" == "update" ]]; then
  if [[ -d "$PLUGIN_DIR/.git" ]]; then
    echo "Updating $PLUGIN_DIR ..."
    git -C "$PLUGIN_DIR" pull origin "$BRANCH"
  else
    echo "Error: $PLUGIN_DIR is not a git clone. Use --clone first."
    exit 1
  fi
else
  echo "Symlinking $REPO_DIR → $PLUGIN_DIR"
  ln -sfn "$REPO_DIR" "$PLUGIN_DIR"
fi

# Verify plugin manifest
if [[ ! -f "$PLUGIN_DIR/.cursor-plugin/plugin.json" ]]; then
  echo "Error: plugin manifest not found at $PLUGIN_DIR/.cursor-plugin/plugin.json"
  exit 1
fi

# --- Install global skills (redundant with plugin, but ensures discovery) ---
mkdir -p "$SKILLS_DIR"
echo ""
echo "Linking skills to $SKILLS_DIR ..."
for skill in "$PLUGIN_DIR/.cursor/skills"/*/; do
  name="$(basename "$skill")"
  ln -sfn "$skill" "$SKILLS_DIR/$name"
  echo "  ✓ $name"
done

# --- Summary ---
echo ""
echo "=== Install complete ==="
echo ""
echo "NEXT STEPS (required):"
echo ""
echo "  1. Open Cursor → Settings"
echo "     Enable: 'Include third-party Plugins, Skills, and other configs'"
echo ""
echo "  2. Run: Developer → Reload Window"
echo ""
echo "  3. Verify: Customize → Rules"
echo "     You should see 'companion' (Always) + 4 more rules from archelon-dev-hub"
echo ""
echo "  4. Verify: Customize → Skills"
echo "     You should see: plan-then-build, token-audit, wiki-maintain, etc."
echo ""
echo "  5. Copy User Rules (one-time):"
echo "     Open: $PLUGIN_DIR/user-rules/GLOBAL-USER-RULES.md"
echo "     Paste content between --- markers into Settings → Rules → User Rules"
echo ""
echo "  Ponytail (lazy senior dev mode) is included:"
echo "     Rule: ponytail.mdc (always-on) + 6 ponytail skills"
echo "     Standalone install: ./setup/install-ponytail.sh"
echo ""
echo "Plugin path: $PLUGIN_DIR"
echo "Skills path: $SKILLS_DIR"
echo ""
