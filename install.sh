#!/usr/bin/env bash
# Link the configs in this repo into place. Anything already at a target is
# moved to ~/.local/state/dotfiles-backup/<timestamp>/ first.
#
#   ./install.sh          create or repair the links
#   ./install.sh --check  report links that are missing or were replaced by a file
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_SUPPORT="$HOME/Library/Application Support"
BACKUP="$HOME/.local/state/dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# repo path -> live path
LINKS=(
  "zsh/zshrc|$HOME/.zshrc"
  "zsh/zprofile|$HOME/.zprofile"
  "zsh/hushlogin|$HOME/.hushlogin"
  "starship/starship.toml|$HOME/.config/starship.toml"
  "ghostty/config|$APP_SUPPORT/com.mitchellh.ghostty/config"
  "mamba/condarc|$HOME/.condarc"
  "git/gitconfig|$HOME/.gitconfig"
  "git/ignore|$HOME/.config/git/ignore"
  "git/hooks|$HOME/.config/git/hooks"
  "zed/settings.json|$HOME/.config/zed/settings.json"
  "nvim|$HOME/.config/nvim"
  "vscode/settings.json|$APP_SUPPORT/Code/User/settings.json"
)

check=false
[[ "${1:-}" == "--check" ]] && check=true
problems=0

for entry in "${LINKS[@]}"; do
  src="$ROOT/${entry%%|*}"
  dest="${entry#*|}"

  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    $check && echo "ok      $dest"
    continue
  fi

  if $check; then
    if [[ -e "$dest" ]]; then echo "DRIFT   $dest is not linked to the repo"; else echo "MISSING $dest"; fi
    problems=$((problems + 1))
    continue
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    mkdir -p "$BACKUP"
    mv "$dest" "$BACKUP/$(basename "$dest")"
    echo "backup  $dest -> $BACKUP/"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked  $dest"
done

if $check; then
  [[ $problems -eq 0 ]] && echo "All links in place." || { echo "$problems problem(s). Run ./install.sh to fix."; exit 1; }
fi
