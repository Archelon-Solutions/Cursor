#!/usr/bin/env bash
# Install Ponytail globally for Cursor (every project).
# Source: https://github.com/DietrichGebert/ponytail (MIT)
#
# Usage:
#   ./setup/install-ponytail.sh           # install from GitHub
#   ./setup/install-ponytail.sh --update  # pull latest ponytail

set -euo pipefail

PONYTAIL_DIR="${HOME}/.cursor/ponytail"
SKILLS_DIR="${HOME}/.cursor/skills"
RULES_DIR="${HOME}/.cursor/plugins/local/archelon-dev-hub/.cursor/rules"
GITHUB_URL="https://github.com/DietrichGebert/ponytail.git"

MODE="${1:-install}"

echo "=== Ponytail — Global Cursor Install ==="
echo ""

# --- Clone or update ponytail source ---
if [[ "$MODE" == "--update" ]]; then
  if [[ -d "$PONYTAIL_DIR/.git" ]]; then
    echo "Updating ponytail at $PONYTAIL_DIR ..."
    git -C "$PONYTAIL_DIR" pull
  else
    echo "Error: $PONYTAIL_DIR not found. Run without --update first."
    exit 1
  fi
else
  if [[ -d "$PONYTAIL_DIR/.git" ]]; then
    echo "Ponytail already cloned at $PONYTAIL_DIR"
  else
    echo "Cloning ponytail to $PONYTAIL_DIR ..."
    git clone --depth 1 "$GITHUB_URL" "$PONYTAIL_DIR"
  fi
fi

# --- Link skills globally ---
mkdir -p "$SKILLS_DIR"
echo ""
echo "Linking ponytail skills to $SKILLS_DIR ..."
for skill in "$PONYTAIL_DIR"/skills/*/; do
  name="$(basename "$skill")"
  ln -sfn "$skill" "$SKILLS_DIR/$name"
  echo "  ✓ $name"
done

# --- Install always-on rule ---
# Option A: via archelon-dev-hub plugin (recommended if installed)
HUB_PLUGIN="${HOME}/.cursor/plugins/local/archelon-dev-hub"
if [[ -d "$HUB_PLUGIN" ]]; then
  mkdir -p "$HUB_PLUGIN/.cursor/rules"
  cp "$PONYTAIL_DIR/.cursor/rules/ponytail.mdc" "$HUB_PLUGIN/.cursor/rules/ponytail.mdc"
  echo ""
  echo "  ✓ ponytail.mdc → archelon-dev-hub plugin (always-on rule)"
else
  # Option B: per-project — copy rule instructions
  echo ""
  echo "  ℹ archelon-dev-hub not found at $HUB_PLUGIN"
  echo "    To get the always-on rule globally, either:"
  echo "    1. Install archelon-dev-hub first (setup/install-global.sh), then re-run this script"
  echo "    2. Copy manually: cp $PONYTAIL_DIR/.cursor/rules/ponytail.mdc <project>/.cursor/rules/"
fi

echo ""
echo "=== Ponytail install complete ==="
echo ""
echo "What you get (every project):"
echo "  Rule:  ponytail.mdc (always-on — lazy senior dev mode)"
echo "  Skills: ponytail, ponytail-review, ponytail-audit, ponytail-debt, ponytail-gain, ponytail-help"
echo ""
echo "NEXT STEPS:"
echo "  1. Developer → Reload Window"
echo "  2. Customize → Rules: confirm 'ponytail' shows as Always"
echo "  3. Customize → Skills: confirm 6 ponytail skills appear"
echo "  4. In Agent chat, try: 'use ponytail mode' or type /ponytail-help"
echo ""
echo "Upstream: https://github.com/DietrichGebert/ponytail"
echo "Update:   ./setup/install-ponytail.sh --update"
