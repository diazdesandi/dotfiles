#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

backup_file() {
  local src="$1"
  local dest="$2"

  if [[ ! -f "$src" ]]; then
    echo "skip  $dest (source missing: $src)"
    return 0
  fi

  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "saved $dest"
}

echo "Backing up configs into $ROOT"
echo

backup_file "$HOME/Library/Application Support/Code/User/settings.json" \
  "$ROOT/Visual Studio Code/settings.json"

backup_file "$HOME/Library/Application Support/Cursor/User/settings.json" \
  "$ROOT/Cursor/settings.json"

backup_file "$HOME/.config/starship.toml" \
  "$ROOT/Starship/starship.toml"

backup_file "$HOME/.zshrc" \
  "$ROOT/Zsh/zshrc"

backup_file "$HOME/zen.omp.json" \
  "$ROOT/Oh-my-posh/zen.omp.json"

backup_file "$HOME/.hyper.js" \
  "$ROOT/Hyper/settings.json"

backup_file "$HOME/.config/ghostty/config" \
  "$ROOT/Ghostty/config.txt"

if [[ -f "$HOME/.config/ghostty/theme" ]]; then
  backup_file "$HOME/.config/ghostty/theme" \
    "$ROOT/Ghostty/theme.txt"
fi

backup_extensions() {
  local cmd="$1"
  local dest="$2"

  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "skip  $dest ($cmd not found)"
    return 0
  fi

  mkdir -p "$(dirname "$dest")"
  "$cmd" --list-extensions >"$dest"
  echo "saved $dest"
}

backup_extensions code "$ROOT/Visual Studio Code/extensions.txt"
backup_extensions cursor "$ROOT/Cursor/extensions.txt"

echo
echo "Done. Review changes with: git -C \"$ROOT\" status"
