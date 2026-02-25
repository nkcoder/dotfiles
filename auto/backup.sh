#!/usr/bin/env bash
# backup.sh — copy dotfiles FROM ~ INTO the dotfiles repo
# Usage: ./auto/backup.sh [-n]   (-n = dry run, shows what would change)

set -euo pipefail

# ── resolve the repo root regardless of where this script is called from ──────
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

source_dir="$HOME"
dest_dir="$REPO_DIR"

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
  mkdir -p "$dst"
  rsync -av --delete $DRY_RUN_FLAG "$src/" "$dst/"
}

# ── helper: sync a single file ─────────────────────────────────────────────────
sync_file() {
  local label="$1" src="$2" dst="$3"
  echo "→ [$label]"
  mkdir -p "$(dirname "$dst")"
  rsync -av --delete $DRY_RUN_FLAG "$src" "$dst"
}

# ── helper: sync files matching a glob ────────────────────────────────────────
sync_glob() {
  local label="$1" pattern="$2" dst="$3"
  echo "→ [$label]"
  mkdir -p "$dst"
  # shellcheck disable=SC2086
  rsync -av --delete $DRY_RUN_FLAG $pattern "$dst/"
}

echo ""
echo "════════════════════════════════════════════"
echo "  Backing up dotfiles: ~ → $dest_dir"
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
  echo "✅  Backup complete: ~ → $dest_dir"
fi
echo ""
