#!/usr/bin/env bash
# Bootstrap Cursor config from this hub into a target project.
# Usage: ./setup/bootstrap-project.sh /path/to/target-project

set -euo pipefail

HUB_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-.}"

if [ ! -d "$TARGET" ]; then
  echo "Error: target directory does not exist: $TARGET"
  exit 1
fi

echo "Bootstrapping Cursor config from $HUB_DIR into $TARGET"

# Core config
mkdir -p "$TARGET/.cursor/rules" "$TARGET/.cursor/skills" "$TARGET/.cursor/reference" "$TARGET/.cursor/plans" "$TARGET/docs/wiki"

cp -r "$HUB_DIR/.cursor/rules/"* "$TARGET/.cursor/rules/"
cp -r "$HUB_DIR/.cursor/skills/"* "$TARGET/.cursor/skills/"
cp -r "$HUB_DIR/.cursor/reference/"* "$TARGET/.cursor/reference/"
cp "$HUB_DIR/.cursor/README.md" "$TARGET/.cursor/README.md"
cp "$HUB_DIR/AGENTS.md" "$TARGET/AGENTS.md"

# Wiki scaffold
if [ ! -f "$TARGET/docs/wiki/index.md" ]; then
  cat > "$TARGET/docs/wiki/index.md" << 'EOF'
# Wiki Index

Initialized from Archelon Solutions Cursor hub. Run the `wiki-maintain` skill to populate.

| Page | Summary | Updated |
|------|---------|---------|
| [overview.md](./overview.md) | System overview (placeholder) | — |
EOF
fi

if [ ! -f "$TARGET/docs/wiki/overview.md" ]; then
  cat > "$TARGET/docs/wiki/overview.md" << 'EOF'
---
title: System Overview
tags: [overview]
updated: pending
---

# System Overview

Placeholder. Ask the agent to run `wiki-maintain` to scan this project and populate this page.
EOF
fi

echo "Done. Next steps:"
echo "  1. Customize .cursor/rules/companion.mdc with project commands"
echo "  2. Copy user-rules/USER-RULES.md to Cursor Settings → User Rules"
echo "  3. Run wiki-maintain skill to populate docs/wiki/"
