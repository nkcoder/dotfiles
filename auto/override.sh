#!/usr/bin/env bash
# override.sh — copy dotfiles FROM the repo OUT TO ~
# Usage: ./auto/override.sh [-n]   (-n = dry run, shows what would change)

set -euo pipefail

# ── resolve the repo root regardless of where this script is called from ──────
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

source_dir="$REPO_DIR"
dest_dir="$HOME"

# ── dry-run support ────────────────────────────────────────────────────────────
DRY_RUN_FLAG=""
if [[ "${1:-}" == "-n" || "${1:-}" == "--dry-run" ]]; then
  DRY_RUN_FLAG="--dry-run"
  echo "⚠️  DRY RUN — no files will be changed"
fi

# ── helper: sync a directory ───────────────────────────────────────────────────
sync_dir() {
  local label="$1" src="$2" dst="$3"
  echo "→ [$label]"
  if [[ -d "$dst" && -z "$DRY_RUN_FLAG" ]]; then
    cp -r "$dst" "${dst}.bak"
    echo "   💾 backed up → ${dst}.bak"
  fi
  mkdir -p "$dst"
  rsync -av --delete $DRY_RUN_FLAG "$src/" "$dst/"
}

# ── helper: sync a single file ─────────────────────────────────────────────────
sync_file() {
  local label="$1" src="$2" dst="$3"
  echo "→ [$label]"
  if [[ -f "$dst" && -z "$DRY_RUN_FLAG" ]]; then
    cp "$dst" "${dst}.bak"
    echo "   💾 backed up → ${dst}.bak"
  fi
  mkdir -p "$(dirname "$dst")"
  rsync -av --delete $DRY_RUN_FLAG "$src" "$dst"
}

# ── helper: sync files matching a glob ────────────────────────────────────────
sync_glob() {
  local label="$1" pattern="$2" dst="$3"
  echo "→ [$label]"
  mkdir -p "$dst"
  if [[ -z "$DRY_RUN_FLAG" ]]; then
    # shellcheck disable=SC2086
    for f in $pattern; do
      local fname; fname="$(basename "$f")"
      if [[ -f "$dst/$fname" ]]; then
        cp "$dst/$fname" "$dst/${fname}.bak"
        echo "   💾 backed up → $dst/${fname}.bak"
      fi
    done
  fi
  # shellcheck disable=SC2086
  rsync -av --delete $DRY_RUN_FLAG $pattern "$dst/"
}

echo ""
echo "════════════════════════════════════════════"
echo "  Applying dotfiles: $source_dir → ~"
echo "════════════════════════════════════════════"
echo ""

# ── config directories ────────────────────────────────────────────────────────
sync_dir   "alacritty"   "$source_dir/.config/alacritty"   "$dest_dir/.config/alacritty"
sync_dir   "nvim"        "$source_dir/.config/nvim"        "$dest_dir/.config/nvim"
sync_glob  "opencode"    "$source_dir/.config/opencode/*.json" "$dest_dir/.config/opencode"
sync_glob  "zed"         "$source_dir/.config/zed/*.json"  "$dest_dir/.config/zed"
sync_dir   "lazygit"     "$source_dir/.config/lazygit"     "$dest_dir/.config/lazygit"
sync_dir   "ghostty"     "$source_dir/.config/ghostty"     "$dest_dir/.config/ghostty"
sync_dir   "hammerspoon" "$source_dir/.hammerspoon"        "$dest_dir/.hammerspoon"

# ── dot files ─────────────────────────────────────────────────────────────────
sync_file  ".zshrc"      "$source_dir/.zshrc"              "$dest_dir/.zshrc"
sync_file  ".gitconfig"  "$source_dir/.gitconfig"          "$dest_dir/.gitconfig"
sync_file  ".vimrc"      "$source_dir/.vimrc"              "$dest_dir/.vimrc"
sync_file  "claude/settings.json" "$source_dir/.claude/settings.json" "$dest_dir/.claude/settings.json"

echo ""
if [[ -n "$DRY_RUN_FLAG" ]]; then
  echo "✅  Dry run complete. Run without -n to apply changes."
else
  echo "✅  Applied dotfiles: $source_dir → ~"
fi
echo ""
