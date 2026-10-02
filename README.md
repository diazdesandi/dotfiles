# dotfiles

My macOS dev setup: shell, prompt, terminal, git and editors. The files in this repo are the live configs; `install.sh` links them into place, so any edit shows up in `git status`.

## Setup

```sh
git clone https://github.com/diazdesandi/dotfiles.git
cd dotfiles
./install.sh
```

Anything already at a target path is moved to `~/.local/state/dotfiles-backup/<timestamp>/` before the link is created. Run it again any time; links that are already correct are left alone.

`./install.sh --check` lists links that are missing or that an app replaced with a regular file.

## What's linked

| Repo | Live path |
|---|---|
| `zsh/zshrc`, `zsh/zprofile`, `zsh/hushlogin` | `~/.zshrc`, `~/.zprofile`, `~/.hushlogin` |
| `starship/starship.toml` | `~/.config/starship.toml` |
| `ghostty/config` | `~/Library/Application Support/com.mitchellh.ghostty/config` |
| `mamba/condarc` | `~/.condarc` |
| `git/gitconfig`, `git/ignore`, `git/hooks/` | `~/.gitconfig`, `~/.config/git/ignore`, `~/.config/git/hooks/` |
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `nvim/` | `~/.config/nvim/` (LazyVim) |
| `vscode/settings.json` | `~/Library/Application Support/Code/User/settings.json` |

`vscode/extensions.txt` is a list, not a link. Refresh it with `code --list-extensions > vscode/extensions.txt` and reinstall with `xargs -L 1 code --install-extension < vscode/extensions.txt`.

## Tools the configs expect

Homebrew: `starship fzf zoxide zsh-autosuggestions zsh-syntax-highlighting git-delta micromamba neovim lazygit gh`. Python comes from a micromamba env named `py314`.

`archive/` holds old JavaScript and TypeScript notes that aren't part of the setup.
