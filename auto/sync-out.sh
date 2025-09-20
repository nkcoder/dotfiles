#!/usr/bin/env sh

source_dir="."
dest_dir=~

# alacritty
rsync -av --delete "$source_dir/.config/alacritty/" "$dest_dir/.config/alacritty"

# nvim
rsync -av --delete "$source_dir/.config/nvim/" "$dest_dir/.config/nvim"

# opencode
rsync -av --delete "$source_dir"/.config/opencode/*.json "$dest_dir/.config/opencode"

# zed
rsync -av --delete "$source_dir"/.config/zed/*.json "$dest_dir/.config/zed"

# lazygit
rsync -av --delete "$source_dir/.config/lazygit/" "$dest_dir/.config/lazygit"

# .zshrc
rsync -a --delete "$source_dir/.zshrc" "$dest_dir/.zshrc"

# .gitconfig
rsync -a --delete "$source_dir/.gitconfig" "$dest_dir/.gitconfig"

# .vimrc
rsync -a --delete "$source_dir/.vimrc" "$dest_dir/.vimrc"

# claude settings
rsync -a --delete "$source_dir/.claude/settings.json" "$dest_dir/.claude/settings.json"

echo "Settings are synced from $source_dir to $dest_dir successfully."
